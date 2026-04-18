-- vim.pack utils

local M = {}

---@class PluginSpec
---@field src string The Git repository of the plugin
---@field name? string Optional plugin name, src name will be used if ommitted
---@field version? vim.VersionRange Optional version for the plugin
---@field opts? table Optional plugin options
---@field after? fun():nil Optional after setup

-- Add plugin.
---@param plugin PluginSpec
function M.add(plugin)
  plugin.name = plugin.name or plugin.src:match '.+/(.+)'

  local spec = {
    src = plugin.src,
  }

  if plugin.version ~= nil then
    spec.version = plugin.version
  end

  vim.pack.add { spec }

  local p = require(plugin.name)

  if type(p.setup) == 'function' then
    p.setup(plugin.opts or {})
  end

  if type(plugin.after) == 'function' then
    plugin.after()
  end
end

---@param plugin PluginSpec
function M.schedule(plugin)
  vim.schedule(function()
    M.add(plugin)
  end)
end

-- Execute add() on event trigger.
---@param event vim.api.keyset.events
---@param plugin PluginSpec
function M.on(event, plugin)
  vim.api.nvim_create_autocmd(event, {
    once = true,
    callback = function()
      M.add(plugin)
    end,
  })
end

-- Execute cmd when PackChanged event triggers.
---@param name string The plugin name
---@param cmd fun():nil The command to execute
function M.on_changed(name, cmd)
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(evt)
      local is_target = evt.data.spec.name == name
      local is_function = type(cmd) == 'function'
      local is_valid_kind = evt.data.kind == 'install' or evt.data.kind == 'update'

      if not (is_target and is_function and is_valid_kind) then
        return
      end

      cmd()
    end,
  })
end

return M

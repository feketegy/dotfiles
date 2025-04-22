-- Code formatter

local M = {
  'stevearc/conform.nvim',
}

M.event = 'BufWritePre'

M.cmd = 'ConformInfo'

M.keys = { {
  '==',
  function()
    require('conform').format { async = true }
  end,
  mode = 'n',
  desc = 'Format the buffer',
} }

M.opts = {
  notify_on_error = true,
  notify_no_formatters = true,

  -- Disable formatting on save
  format_on_save = function()
    return nil
  end,
  default_format_opts = {
    lsp_format = 'fallback',
    stop_after_first = true,
  },
  formatters_by_ft = {
    -- Install formatters using brew or npm
    lua = { 'stylua' },
    go = { 'goimports', 'gofmt', stop_after_first = false },
    javascript = { 'prettierd', 'prettier' },
    javascriptreact = { 'prettierd', 'prettier' },
    typescriptreact = { 'prettierd', 'prettier' },
    typescript = { 'prettierd', 'prettier' },
    css = { 'prettierd', 'prettier' },
    scss = { 'prettierd', 'prettier' },
    markdown = { 'prettierd', 'prettier' },
    html = { 'prettierd', 'prettier' },
    json = { 'prettierd', 'prettier' },
    yaml = { 'prettierd', 'prettier' },
    graphql = { 'prettierd', 'prettier' },
    md = { 'prettierd', 'prettier' },
    txt = { 'prettierd', 'prettier' },
    sql = { 'pg_format' },
  },
}

function M.config(_, opts)
  require('conform').setup(opts)
  require('conform').formatters.pg_format = {
    prepend_args = { '-s', vim.o.shiftwidth },
  }
end

return M

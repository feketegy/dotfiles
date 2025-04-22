-- Custom autocommands, usercommands, etc

local cmd = vim.api.nvim_create_autocmd
local my_commands = vim.api.nvim_create_augroup('my-commands', { clear = true })

cmd('TextYankPost', {
  desc = 'Highlight text when yanking in normal mode',
  group = my_commands,
  callback = function()
    vim.highlight.on_yank {
      timeout = 60,
      on_visual = false,
      higroup = 'Visual',
    }
  end,
})

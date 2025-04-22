vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight text when yanking in normal mode',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      timeout = 60,
      on_visual = false,
      higroup = 'Visual',
    }
  end,
})

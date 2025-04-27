-- Show git signs in edited lines

local M = {
  'lewis6991/gitsigns.nvim',
}

M.event = 'BufEnter'

M.keys = {
  {
    '<leader>gb',
    '<CMD>Gitsigns blame_line<CR>',
    mode = 'n',
    desc = 'Show git blame',
  },
  {
    '<leader>gl',
    '<CMD>Gitsigns toggle_current_line_blame<CR>',
    mode = 'n',
    desc = 'Toggle Git current line blame',
  },
  {
    '<leader>td',
    '<CMD>Gitsigns toggle_deleted<CR>',
    mode = 'n',
    desc = 'Toggle Git deleted',
  },
}

M.opts = {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '' },
  },
}

return M

-- Show git signs in edited lines

local M = {
  'lewis6991/gitsigns.nvim',
}

M.opts = {
  signs = {
    add = { text = 'A' },
    change = { text = 'C' },
    delete = { text = 'D' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

return M

-- Scroll past the last line by vim.opt.scrolloff lines

local M = {
  'Aasim-A/scrollEOF.nvim',
}

M.event = {
  'CursorMoved',
  'WinScrolled',
}

M.opts = {}

return M

-- Autopairs for HTML

local M = {
  'windwp/nvim-ts-autotag',
}

M.event = { 'BufReadPre', 'BufNewFile' }

M.opts = {}

return M

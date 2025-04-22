-- Tree view

local M = {
  'nvim-neo-tree/neo-tree.nvim',
}

M.branch = 'v3.x'

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
}

M.keys = {
  {
    '<C-n>',
    ':Neotree filesystem toggle left<CR>',
    mode = 'n',
    desc = 'Toggle tree view',
  },
}

return M

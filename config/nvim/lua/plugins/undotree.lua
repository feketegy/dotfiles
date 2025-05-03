local M = {
  'mbbill/undotree',
}

M.keys = {
  {
    '<leader>u',
    '<CMD>UndotreeToggle<CR><C-h>',
    mode = 'n',
    desc = 'Toggle Undo Tree',
  },
}

return M

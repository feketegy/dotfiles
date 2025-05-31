-- Picker using fzf

local M = {
  'ibhagwan/fzf-lua',
}

M.enabled = false

M.dependencies = {
  'nvim-tree/nvim-web-devicons',
}

M.keys = {

  {
    '<leader>ff',
    function()
      require('fzf-lua').files()
    end,
    mode = 'n',
    desc = 'Find files',
  },
  {
    '<leader>fo',
    function()
      require('fzf-lua').oldfiles()
    end,
    mode = 'n',
    desc = 'Find old files',
  },
  {
    '<leader>fg',
    function()
      require('fzf-lua').live_grep()
    end,
    mode = 'n',
    desc = 'Grep in current project',
  },
  {
    '<leader>/',
    function()
      require('fzf-lua').lgrep_curbuf()
    end,
    mode = 'n',
    desc = 'Grep in current buffer',
  },
  {
    '<leader><leader>',
    function()
      require('fzf-lua').buffers()
    end,
    mode = 'n',
    desc = 'Find in open buffers',
  },
}

M.opts = {}

return M

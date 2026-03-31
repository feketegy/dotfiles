-- QoL plugins

local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
}

M.keys = {
  {
    '<leader>ff',
    function()
      Snacks.picker.files()
    end,
    mode = 'n',
    desc = 'Find files',
  },
  {
    '<leader>fc',
    function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
    end,
    mode = 'n',
    desc = 'Find configs',
  },
  {
    '<leader>fg',
    function()
      Snacks.picker.grep()
    end,
    mode = 'n',
    desc = 'Grep in current project',
  },
  {
    '<leader>fgr',
    function()
      Snacks.picker.resume { source = 'grep' }
    end,
    mode = 'n',
    desc = 'Resume last grep',
  },
  {
    '<leader>/',
    function()
      Snacks.picker.lines()
    end,
    mode = 'n',
    desc = 'Grep in current buffer',
  },
  {
    '<leader><leader>',
    function()
      Snacks.picker.smart {
        multi = { 'buffers' },
      }
    end,
    mode = 'n',
    desc = 'Find in open buffers',
  },
  {
    '<leader>km',
    function()
      Snacks.picker.keymaps()
    end,
    mode = 'n',
    desc = 'Find keymaps',
  },
}

M.opts = {
  bigfile = {
    enabled = true,
  },

  indent = {
    enabled = true,
    animate = {
      enabled = false,
    },
    indent = {
      only_scope = true,
      only_current = true,
    },
    scope = {
      hl = 'LineNr',
    },
  },

  input = {
    enabled = true,
    style = 'fancy',
  },

  quickfile = {
    enabled = true,
  },

  picker = {
    enabled = true,
    prompt = ' ',
    sources = {},
    focus = 'input',
    layout = {
      cycle = true,
      preset = function()
        return vim.o.columns >= 120 and 'default' or 'vertical'
      end,
    },
  },

  dashboard = {
    enabled = true,
    preset = {
      pick = 'fzf_lua',
      header = [[
⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⢀⣤⠶⠿⠿⠿⣷⣦⣄⠀⠀⠀
⠀⠀⠀⣠⣾⣿⠿⠛⠛⠛⠛⠛⠿⣦⣄⠀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠉⢻⣷⡄⠀
⠀⢀⣾⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠙⣦⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠀
⠀⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀
⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠏⠀
⠀⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⠈⠢⢀⠀⠀⠀⠀⢀⣠⠾⠋⠀⠀
⠀⠈⢿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⠄⠂⠈⠉⠉⠑⠲⢯⡉⠁⠀⠀⠀⠀
⠀⠀⠀⠛⢷⣄⡀⠀⠀⠀⠀⠀⢀⠠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠛⠒⠒⠒⠉⠁⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡟⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣀⠀⠀⠀⠀⠀⣀⣴⣿⠟⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⢿⣶⣿⡿⠿⠛⠁⠀⠀⠀⠀⠀
    ]],
    },
    sections = {
      { section = 'header' },
    },
  },
}

return M

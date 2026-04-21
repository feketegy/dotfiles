-- QoL plugins

local header = [[
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
]]

local add = require('utils.vim-pack').add
local map = require('utils.keymap').map

add {
  name = 'snacks',
  src = 'https://github.com/folke/snacks.nvim',
  opts = {

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
        preset = 'bottom',
      },
    },

    dashboard = {
      enabled = true,
      preset = {
        pick = 'fzf_lua',
        header = header,
      },
      sections = {
        { section = 'header' },
      },
    },
  },
  after = function()
    map('<leader>ff', function()
      Snacks.picker.files()
    end, 'Find files')

    map('<leader>fc', function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
    end, 'Find configs')

    map('<leader>fg', function()
      Snacks.picker.grep()
    end, 'Grep in current project')

    map('<leader>fgr', function()
      Snacks.picker.resume { source = 'grep' }
    end, 'Resume last grep')

    map('<leader>/', function()
      Snacks.picker.lines()
    end, 'Grep in current buffer')

    map('<leader><leader>', function()
      Snacks.picker.smart { multi = { 'buffers' } }
    end, 'Find in open buffers')

    map('<leader>km', function()
      Snacks.picker.keymaps()
    end, 'Find keymaps')

    map('<leader>u', function()
      Snacks.picker.undo()
    end, 'Open undo')
  end,
}

-- QoL plugins

local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
}

M.keys = {
  {
    '<leader>d',
    function()
      Snacks.dashboard()
    end,
    desc = 'Show dashboard',
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

  notifier = {},

  quickfile = {},

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
      { section = 'keys', indent = 2, padding = 1 },
      { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
      { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
    },
  },
}

return M

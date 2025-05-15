-- File navigations, editing

local M = {
  'stevearc/oil.nvim',
}

M.dependencies = {
  { 'echasnovski/mini.icons', opts = {} },
}

M.keys = {
  {
    '-',
    '<CMD>Oil --float<CR>',
    mode = 'n',
    desc = 'Open Oil file manager in a floating window',
  },
}

M.opts = {
  default_file_exlorer = true,
  delete_to_trash = true,

  columns = {
    'icons',
  },

  view_options = {
    show_hidden = true,
  },

  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = 'rounded',
    win_options = {
      winblend = 0,
    },

    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = 'auto',

    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
}

return M

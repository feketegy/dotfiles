local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Custom color scheme
-- config.colors = {
--   background = "#000000",
--   foreground = "#ffa028",
--   cursor_bg = "#ffa028",
--   cursor_border = "#ffa028",
--   cursor_fg = "#000000",
--   selection_bg = "#ffa028",
--   selection_fg = "#000000",

--   ansi = {"#000000","#FF3428","#f6fe11","#c2a86c","#7a4f17","#7a4f17","#ffa028","#ffa028"},
--   brights = {"#666666","#feba11","#777777","#feba11","#feba11","#feba11","#ffa028","#ffa028"}
-- }

local theme = wezterm.color.get_builtin_schemes()['Tokyo Night']
theme.background = '#000000'

config.color_schemes = {
  ['Modified Tokyo Night'] = theme 
}

config.color_scheme = 'Modified Tokyo Night'

-- Font
config.font = wezterm.font("Mononoki Nerd Font Mono")
config.font_size = 14
config.bold_brightens_ansi_colors = true
config.cell_width = 1.0
config.line_height = 1.5

-- Terminal features
config.enable_tab_bar = true
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1

config.window_close_confirmation = 'NeverPrompt'

config.default_cursor_style = 'BlinkingBar'

-- Key bindings
local act = wezterm.action

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackOnly',
      act.SendKey { key = 'L', mods = 'CTRL' },
    }    
  },
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = '~',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
}

return config
-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Override the Tokyo Night color scheme
local tokyo_night = wezterm.color.get_builtin_schemes()['Tokyo Night']
tokyo_night.background = "#0e0e0e"

config.color_schemes = {
  ['George Tokyo Night'] = tokyo_night
}

config.color_scheme = 'George Tokyo Night'


-- Font
config.font = wezterm.font("Mononoki Nerd Font Mono")
config.font_size = 13
config.bold_brightens_ansi_colors = true
config.cell_width = 1.1
config.line_height = 1.5


-- Terminal features
config.enable_tab_bar = true
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 8



return config
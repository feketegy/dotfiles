-- Statusline
-- A lot of stuff is from: https://github.com/benfrain/neovim/blob/main/lua/setup/lualine.lua

-- -----
-- UTILS
-- -----
--
-- Show little dot when recording a macro
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return ' ' .. recording_register
  end
end

-- Remap modes to abbreviations
local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = 'C',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

local M = {
  'nvim-lualine/lualine.nvim',
}

M.event = 'ColorScheme'

M.dependencies = {
  'nvim-tree/nvim-web-devicons',
}

M.opts = {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(s)
          return mode_map[s] or s
        end,
      },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = ' ', -- Text to show when the file is modified.
          readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]', -- Text to show for new created file before first writting
        },
      },
      { show_macro_recording, color = { fg = '#ff6666' } },
    },
    lualine_x = {
      {
        'lsp_status',
        icons_enabled = false,
        color = { fg = '#6e6a86' },
      },
      {
        'filetype',
        icons_enabled = false,
        color = { fg = '#6e6a86' },
      },
    },
    lualine_y = { nil },
    lualine_z = {
      {
        'location',
        color = { bg = '#232138', fg = '#6e6a86' },
      },
    },
  },
}

-- function M.config(_, opts)
--   local theme = require 'lualine.themes.rose-pine'
--   local colors = require 'rose-pine.palette'
--
--   theme.normal.c.bg = colors.base
--   theme.insert.c.bg = colors.base
--   theme.visual.c.bg = colors.base
--   theme.replace.c.bg = colors.base
--   theme.command.c.bg = colors.base
--   theme.command.c.bg = colors.base
--
--   opts.options.theme = theme
--
--   require('lualine').setup(opts)
-- end

return M

local M = {}

function M.rosepine()
  return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      local config = require 'rose-pine'
      local colors = require 'rose-pine.palette'

      config.setup {
        variant = 'main',
        dark_variant = 'main',

        styles = {
          italic = false,
          transparency = true,
        },

        highlight_groups = {
          Normal = { bg = '#101115' },
          Comment = { italic = true },
          CursorLine = { bg = '#1E202E' },
          CursorLineNr = { fg = colors.subtle },
        },
      }

      vim.cmd.colorscheme 'rose-pine'

      -- Transparent background
      vim.cmd [[
        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
      ]]
    end,
  }
end

function M.rosebones()
  return {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.rosebones = {
        transparent_background = true,
        lighten_cursor_line = 1,
      }

      vim.cmd.colorscheme 'rosebones'

      -- Custom mods after the colorscheme is loaded

      -- Make the StatusLine transparent for lualine to have a transparent bg
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = nil })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = nil })

      -- Overwrite the float windows bg and fg
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', fg = '#e4d3d4' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = '#e4d3d4' })
    end,
  }
end

-- return M.rosepine()
return M.rosebones()

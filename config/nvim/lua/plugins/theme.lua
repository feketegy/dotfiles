-- return {
--  'catppuccin/nvim',
--  name = 'catppuccin',
--  priority = 1000,
--  lazy = false,
--  config = function()
--    require('catppuccin').setup {
--      flavour = 'mocha',
--      color_overrides = {
--        all = {
--          base = '#11121a',
--        },
--      },
--    }
--
--    vim.cmd.colorscheme 'catppuccin'
--  end,
-- }

-- Theme configuration
-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local config = require 'tokyonight'
--     config.setup {
--       style = 'night',
--       styles = {
--         functions = {},
--       },
--       -- overwrite theme colors
--       on_colors = function(colors)
--         colors.bg = '#11121a'
--       end,
--       on_highlights = function(highlights)
--         highlights.WinSeparator.fg = '#383c5a'
--       end,
--     }

--     vim.cmd.colorscheme 'tokyonight'
--   end,
-- }

return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  config = function()
    local config = require 'rose-pine'
    config.setup {
      variant = 'moon',

      styles = {
        functions = {},
      },

      palette = {
        moon = {
          base = '#11121a'
        }
      }
    }

    vim.cmd.colorscheme 'rose-pine'
  end,
}

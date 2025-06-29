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
        variant = 'moon',
        dark_variant = 'moon',

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
    end,
  }
end

function M.sequoia_main()
  return {
    'forest-nvim/sequoia.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'sequoia-night'
    end,
  }
end

function M.zenbones()
  return {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.kanagawabones_darkness = 'stark'
      vim.cmd.colorscheme 'kanagawabones'
    end,
  }
end

return M.rosepine()
-- return M.zenbones()

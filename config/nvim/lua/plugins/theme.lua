local M = {}

function M.rosepine()
  return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      local config = require 'rose-pine'
      config.setup {
        variant = 'moon',
        dark_variant = 'moon',

        styles = {
          italic = false,
          transparency = true,
        },

        highlight_groups = {
          Normal = { bg = '#111111' },
          Comment = { italic = true },
          CursorLine = { bg = '#1E202E' },
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

return M.rosepine()

-- Directory and file navigator
return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })

    local config = require 'oil'
    config.setup {
      default_file_exlorer = true,
      columns = {
        'icons',
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
        preview_split = 'auto',
        override = function(conf)
          return conf
        end,
      },
      keymaps = {
        ['<ESC><ESC>'] = 'actions.close',
      },
    }
  end,
}

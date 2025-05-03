-- Keymaps and filetype mappings

-- ------------------
-- Utils for mappings
-- ------------------

-- Close floating windows
local function close_floating()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == 'win' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

-- Keymap shortcut
local function map(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

-- -------
-- Keymaps
-- -------

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', function()
  close_floating()
  vim.cmd ':nohlsearch'
end, {
  silent = true,
  desc = 'Remove search highlight and dismiss popups',
})

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keep current line in the center when moving up / down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Buffers
map('n', '<leader>q', '<CMD>bd<CR>', { desc = 'Close buffer' })

-- ---------
-- Filetypes
-- ---------
vim.filetype.add {
  extension = {
    -- PostCSS mapped to CSS
    pcss = 'css',
  },
}

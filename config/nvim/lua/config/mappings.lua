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

-- Line movements
map('n', 'j', 'gj', { desc = 'Move down the visible line' })
map('n', 'k', 'gk', { desc = 'Move up the visible line' })
map('n', '<Down>', 'gj', { desc = 'Move down the visible line' })
map('n', '<Up>', 'gk', { desc = 'Move up the visible line' })

--  Use CTRL+<hjkl> to switch between windows/splits
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resizing splits
map('n', '<C-S-k>', '<CMD>:resize +2<CR>', { desc = 'Resize h split +2 lines' })
map('n', '<C-S-j>', '<CMD>:resize -2<CR>', { desc = 'Resize h split -2 lines' })
map('n', '<C-S-h>', '<CMD>:vertical resize +2<CR>', { desc = 'Resize v split +2 lines' })
map('n', '<C-S-l>', '<CMD>:vertical resize -2<CR>', { desc = 'Resize v split -2 lines' })

-- Splits / windows management
map('n', 's', '<C-w>', { desc = 'Manage splits' })

-- Keep current line in the center when moving up / down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Buffers

-- Buffer movements
map('n', '<TAB>', '<CMD>:bn<CR>', { desc = 'Move to next buffer' })
map('n', '<S-TAB>', '<CMD>:bp<CR>', { desc = 'Move to previous buffer' })

-- Delete/Close buffer
map('n', '<leader>q', '<CMD>bd<CR>', { desc = 'Close buffer' })
map('n', '<leader>q!', '<CMD>bd!<CR>', { desc = 'Close buffer without saving' })

-- Create empty buffer
map('n', '<leader>n', '<CMD>:enew<CR>', { desc = 'New empty buffer' })

-- Save file and prompt for filename if the buffer name is empty
map('n', '<leader>w', function()
  local save_file = function(path)
    local ok, err = pcall(vim.cmd.w, path)

    if not ok then
      -- clear `vim.ui.input` from cmdline to make space for an error
      vim.cmd.redraw()
      vim.notify(err, vim.log.levels.ERROR, {
        title = 'error while saving file',
      })
    end
  end

  if vim.api.nvim_buf_get_name(0) ~= '' then
    save_file()
  else
    vim.ui.input({ prompt = 'filename: ' }, save_file)
  end
end, { desc = 'Save file' })

-- ---------
-- Filetypes
-- ---------
vim.filetype.add {
  extension = {
    -- PostCSS mapped to CSS
    pcss = 'css',
  },
}

-- LSP colors
local apply_document_color = function()
  -- "_off" is a special trigger to turn the document color off
  -- possible values for the style: "background", "foreground", "virtual", or any string character
  -- DOCUMENT_COLOR_STYLE in all caps to save the variable between sessions
  local opts = { 'background', 'foreground', '󰌁 ', '_off' }
  local idx = ((vim.g.DOCUMENT_COLOR_STYLE or 1) % #opts)

  vim.g.DOCUMENT_COLOR_STYLE = idx

  if opts[idx + 1] == '_off' then
    vim.lsp.document_color.enable(false)
    return
  end

  vim.lsp.document_color.enable(false)
  vim.lsp.document_color.enable(true, nil, { style = opts[idx + 1] })
end

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('document-color', { clear = true }),

  callback = function(evt)
    apply_document_color()

    vim.keymap.set('n', '<leader>cc', function()
      vim.g.DOCUMENT_COLOR_STYLE = vim.g.DOCUMENT_COLOR_STYLE + 1
      apply_document_color()
    end, { buffer = evt.buf, desc = 'Highlight color references in the document.' })
  end,
})

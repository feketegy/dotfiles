-- Keymaps and filetype mappings

-- ------------------
-- Utils for mappings
-- ------------------

-- Close floating windows
local function close_floating()
	for _, win in pairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative == "win" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

local function save_file(path)
	local ok, err = pcall(vim.cmd.w, path)

	if not ok then
		-- clear `vim.ui.input` from cmdline to make space for an error
		vim.cmd.redraw()
		vim.notify(err, vim.log.levels.ERROR, {
			title = "Saving file",
		})
	end
end

-- ----
-- Deps
-- ----
local map = require("utils.keymap").map

-- -------
-- Keymaps
-- -------

-- Clear highlights on search when pressing <Esc> in normal mode
map("<Esc>", function()
	close_floating()
	vim.cmd(":nohlsearch")
end, "Remove search highlight and dismiss popups", "n", nil, true)

map("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode", "t")

-- Line movements
map("j", "gj", "Move down the visible line")
map("k", "gk", "Move up the visible line")
map("<Down>", "gj", "Move down the visible line")
map("<Up>", "gk", "Move up the visible line")

--  Use CTRL+<hjkl> to switch between windows/splits
map("<C-h>", "<C-w><C-h>", "Move focus to the left window")
map("<C-l>", "<C-w><C-l>", "Move focus to the right window")
map("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- Splits - resize
map("<C-S-k>", "<CMD>:resize +2<CR>", "Resize horizontal split 2 lines")
map("<C-S-j>", "<CMD>:resize -2<CR>", "Resize horizontal split -2 lines")
map("<C-S-h>", "<CMD>:vertical resize +2<CR>", "Resize vertical split 2 lines")
map("<C-S-l>", "<CMD>:vertical resize -2<CR>", "Resize vertical split -2 lines")

-- Splits - windows management
map("s", "<C-w>", "Manage splits")

-- Keep current line in the center when moving up / down
map("<C-d>", "<C-d>zz")
map("<C-u>", "<C-u>zz")

-- Buffers - movements
map("<TAB>", "<CMD>:bn<CR>", "Move to the next buffer")
map("<S-TAB>", "<CMD>:bp<CR>", "Move to the previous buffer")

-- Buffers - delete/close
map("<leader>q", "<CMD>bd<CR>", "Close buffer")
map("<leader>q!", "<CMD>bd!<CR>", "Close buffer without saving")

-- Buffers - create empty
map("<leader>n", "<CMD>:enew<CR>", "New empty buffer")

-- Buffers - Save or save empty and prompt for the filename
map("<leader>w", function()
	if vim.api.nvim_buf_get_name(0) ~= "" then
		save_file()
	else
		vim.ui.input({ prompt = "filename: " }, save_file)
	end
end, "Save file")

-- ---------
-- Filetypes
-- ---------
vim.filetype.add({
	extension = {
		-- PostCSS mapped to CSS
		pcss = "css",
	},
})


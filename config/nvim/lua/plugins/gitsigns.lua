-- Show git signs in edited lines

local on = require("utils.vim-pack").on
local map = require("utils.keymap").map

on("BufEnter", {
	name = "gitsigns",
	src = "https://github.com/lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "" },
		},
	},
	after = function()
		map("<leader>gb", "<CMD>Gitsigns blame_line<CR>", "Show git blame")
		map("<leader>gl", "<CMD>Gitsigns toggle_current_line_blame<CR>", "Toggle current git line blame")
		map("<leader>td", "<CMD>Gitsigns toggle_deleted<CR>", "Toggle git deleted lines")
	end,
})

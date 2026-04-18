-- Scroll past the last line by vim.opt.scrolloff lines

local on = require("utils.vim-pack").on

on({ "CursorMoved", "WinScrolled" }, {
	name = "scrollEOF",
	src = "https://github.com/Aasim-A/scrollEOF.nvim",
})

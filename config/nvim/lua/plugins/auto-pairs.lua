-- Autopair opening/closing tags

local on = require("utils.vim-pack").on

on("InsertEnter", {
	src = "https://github.com/windwp/nvim-autopairs",
	opts = {
		disable_filetype = { "TelescopePrompt" },
		disable_in_macro = false,
		check_ts = true,
	},
})

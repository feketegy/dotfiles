-- File navigations, editing
local add = require("utils.vim-pack").add
local map = require("utils.keymap").map

add({
	name = "oil",
	src = "https://github.com/stevearc/oil.nvim",
	opts = {
		default_file_exlorer = true,
		delete_to_trash = true,

		columns = {
			"icons",
		},

		view_options = {
			show_hidden = true,
		},

		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 0,
			},

			-- preview_split: Split direction: "auto", "left", "right", "above", "below".
			preview_split = "auto",

			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},

		keymaps = {
			["<Esc><Esc>"] = { "actions.close", mode = "n" },
		},
	},
	after = function()
		map("-", "<CMD>Oil --float<CR>", "Open file manager in a floating window")
	end,
})

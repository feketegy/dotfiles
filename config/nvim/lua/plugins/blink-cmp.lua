-- Autocompletion

local add = require("utils.vim-pack").add
local on_changed = require("utils.vim-pack").on_changed

vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })

add({
	src = "https://github.com/saghen/blink.cmp",
	version = vim.version.range("1.*"),
	opts = {
		completion = {
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = true,
			},
			list = {
				max_items = 20,
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = { border = "rounded" },
			},
			ghost_text = {
				enabled = false,
			},
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		keymap = {
			preset = "default",
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-Space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "accept", "fallback" },
			["<C-Up>"] = { "scroll_documentation_up", "fallback" },
			["<C-Down>"] = { "scroll_documentation_down", "fallback" },
		},
		signature = {
			enabled = true,
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
})

on_changed("blink.cmp", function()
	vim.notify("Building blink.cmp", vim.log.levels.INFO)
	local obj = vim.system({ "cargo", "build", "--release" }, { cwd = params.path }):wait()
	if obj.code == 0 then
		vim.notify("Building blink.cmp done", vim.log.levels.INFO)
	else
		vim.notify("Building blink.cmp failed", vim.log.levels.ERROR)
	end
end)

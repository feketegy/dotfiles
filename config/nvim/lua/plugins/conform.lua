-- Code formatter

local on = require("utils.vim-pack").on
local map = require("utils.keymap").map

on("BufEnter", {
	name = "conform",
	src = "https://github.com/stevearc/conform.nvim",
	opts = {
		-- log_level = vim.log.levels.DEBUG,
		notify_on_error = true,
		notify_no_formatters = true,

		-- Disable formatting on save
		format_on_save = function()
			return nil
		end,

		default_format_opts = {
			lsp_format = "fallback",
			stop_after_first = true,
		},
		formatters_by_ft = {
			-- Install formatters using brew or npm
			lua = { "stylua" },
			go = { "goimports", "gofmt", stop_after_first = true },
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			scss = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			graphql = { "prettierd", "prettier" },
			md = { "prettierd", "prettier" },
			txt = { "prettierd", "prettier" },
			sql = { "pg_format" },
			templ = {
				"templ",
			},
		},
		formatters = {
			pg_format = {
				prepend_args = { "-s", vim.o.shiftwidth },
			},
		},
	},
	after = function()
		map("==", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, "Format the buffer")
	end,
})

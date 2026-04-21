-- LSP configs

local autocmd = vim.api.nvim_create_autocmd

-- Install the helper package
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-- -------
-- Helpers
-- -------

-- Set a keymap to toggle inlay hints if the LSP supports it
local function lsp_map_inlay_hints(client, buf)
	if not client or not client:supports_method("textDocument/inlayHint", buf) then
		return
	end

	local map = require("utils.keymap").map
	map("<leader>th", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
	end, "Toggle inlay hints", "n", buf)
end

-- Highlight references under the cursor
local function lsp_highlight_references(client, buf)
	if not client or not client:supports_method("textDocument/documentHighlight", buf) then
		return
	end

	local group = vim.api.nvim_create_augroup("feketegy/lsp-word-highlight", { clear = false })

	autocmd({ "CursorHold", "CursorHoldI" }, {
		buffer = buf,
		group = group,
		callback = vim.lsp.buf.document_highlight,
	})

	autocmd({ "CursorMoved", "CursorMovedI" }, {
		buffer = buf,
		group = group,
		callback = vim.lsp.buf.clear_references,
	})
end

-- Highlight color codes, use shada to save the current option
local function lsp_highlight_colors(client, buf)
	if not client or not client:supports_method("textDocument/documentColor", buf) then
		return
	end

	local apply_document_color = function()
		-- "_off" is a special trigger to turn the document color off
		-- possible values for the style: "background", "foreground", "virtual", or any string character
		-- DOCUMENT_COLOR_STYLE in all caps to save the variable between sessions
		local opts = { "background", "foreground", "󰌁 ", "_off" }
		local idx = ((vim.g.DOCUMENT_COLOR_STYLE or 1) % #opts)

		vim.g.DOCUMENT_COLOR_STYLE = idx

		if opts[idx + 1] == "_off" then
			vim.lsp.document_color.enable(false)
			return
		end

		vim.lsp.document_color.enable(false)
		vim.lsp.document_color.enable(true, nil, { style = opts[idx + 1] })
	end

	apply_document_color()

	local map = require("utils.keymap").map

	map("<leader>gcc", function()
		vim.g.DOCUMENT_COLOR_STYLE = vim.g.DOCUMENT_COLOR_STYLE + 1
		apply_document_color()
	end, "Highlight color references in the current buffer", "n", buf)
end

-- Set general keymaps
local function lsp_enable_general_keymaps(buf)
	local map = require("utils.keymap").map

	map("<leader>dq", vim.diagnostic.setloclist, "Open diagnostic quickfix list", "n", buf)
	map("<leader>df", vim.diagnostic.open_float, "Open diagnostic in a floating window", "n", buf)
	map("K", vim.lsp.buf.hover, "Show info under cursor", "n", buf)
	map("gca", vim.lsp.buf.code_action, "Go to code action", "n", buf)

	map("<leader>ds", function()
		Snacks.picker.lsp_type_definitions()
	end, "Show type definitions", "n", buf)

	map("gr", function()
		Snacks.picker.lsp_references()
	end, "Show references", "n", buf)

	map("gd", function()
		Snacks.picker.lsp_definitions()
	end, "Go to definition", "n", buf)

	map("gI", function()
		Snacks.picker.lsp_implementations()
	end, "Show implementations", "n", buf)
end

-- Custom diagnostics setup
local function lsp_enable_diagnostics()
	vim.diagnostic.config({
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅚 ",
				[vim.diagnostic.severity.WARN] = "󰀪 ",
				[vim.diagnostic.severity.INFO] = "󰋽 ",
				[vim.diagnostic.severity.HINT] = "󰌶 ",
			},
		},
		virtual_text = {
			source = "if_many",
			spacing = 2,
		},
	})
end

-- ----
-- MAIN
-- ----

autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("feketegy/lsp-attach", { clear = true }),
	callback = function(evt)
		local client = vim.lsp.get_client_by_id(evt.data.client_id)

		lsp_enable_general_keymaps(evt.buf)
		lsp_enable_diagnostics()
		lsp_map_inlay_hints(client, evt.buf)
		lsp_highlight_references(client, evt.buf)
		lsp_highlight_colors(client, evt.buf)
	end,
})

autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
	callback = function(evt)
		vim.lsp.buf.clear_references()
		vim.api.nvim_clear_autocmds({ group = "feketegy/lsp-word-highlight", buffer = evt.buf })
	end,
})

autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		-- Wire up the LSP capabilities
		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })

		-- Make sure to install LSP servers with brew or npm
		vim.lsp.enable({
			"gopls",
			"lua_ls",
			"html",
			"cssls",
			"cssmodules_ls",
			"tailwindcss",
			"ts_ls",
			"jsonls",
			"dockerls",
			"intelephense",
			"sqls",
		})
	end,
})

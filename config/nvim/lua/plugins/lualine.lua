-- Statusline
-- A lot of stuff is from: https://github.com/benfrain/neovim/blob/main/lua/setup/lualine.lua

local on = require("utils.vim-pack").on
local add = require("utils.vim-pack").add

-- DEPS
add({ src = "https://github.com/nvim-tree/nvim-web-devicons" })

-- UTILS

-- Show a little dot and the register char when recording a macro
local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return " " .. recording_register
	end
end

-- Separate the filename and symbols into different highlight groups
local function filename_with_symbols()
	vim.api.nvim_set_hl(0, "LualineFilename", { fg = "#5a576e" })
	vim.api.nvim_set_hl(0, "LualineSymbols", { fg = "#9492a6" })

	local filename = vim.fn.expand("%:.")

	if filename == "" then
		filename = "[No Name]"
	end

	local modified = vim.bo.modified and "" or ""
	local readonly = (not vim.bo.modifiable or vim.bo.readonly) and "" or ""

	-- Apply highlights manually
	local fname_hl = "%#LualineFilename#"
	local symbol_hl = "%#LualineSymbols#"

	return table.concat({
		fname_hl,
		filename,
		" ",
		symbol_hl,
		modified,
		readonly,
	})
end

-- Remap modes to abbreviations
local mode_map = {
	["NORMAL"] = "N",
	["O-PENDING"] = "N?",
	["INSERT"] = "I",
	["VISUAL"] = "V",
	["V-BLOCK"] = "VB",
	["V-LINE"] = "VL",
	["V-REPLACE"] = "VR",
	["REPLACE"] = "R",
	["COMMAND"] = "C",
	["SHELL"] = "SH",
	["TERMINAL"] = "T",
	["EX"] = "X",
	["S-BLOCK"] = "SB",
	["S-LINE"] = "SL",
	["SELECT"] = "S",
	["CONFIRM"] = "Y?",
	["MORE"] = "M",
}

-- MAIN
on("ColorScheme", {
	name = "lualine",
	src = "https://github.com/nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(s)
						return mode_map[s] or s
					end,
				},
			},
			lualine_b = {
				"branch",
			},
			lualine_c = {
				{ filename_with_symbols },
				{ show_macro_recording, color = { fg = "#ff6666" } },
			},
			lualine_x = { nil },
			lualine_y = { nil },
			lualine_z = {
				"diagnostics",
				{
					"lsp_status",
					icons_enabled = false,
				},
				{
					"filetype",
					icons_enabled = false,
				},
			},
		},
	},
	after = function()
		local auto_theme = require("lualine.themes.auto")

		auto_theme.normal.c.bg = "NONE"
		auto_theme.normal.z = {
			bg = "NONE",
			fg = "#3e3a54",
		}

		auto_theme.insert.z = auto_theme.normal.z
		auto_theme.replace.z = auto_theme.normal.z
		auto_theme.visual.z = auto_theme.normal.z
		auto_theme.command.z = auto_theme.normal.z
	end,
})

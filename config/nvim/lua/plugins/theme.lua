vim.pack.add({
  { src = "https://github.com/zenbones-theme/zenbones.nvim" },
  { src = "https://github.com/rktjmp/lush.nvim" }
})

vim.g.rosebones = {
  transparent_background = true,
  lighten_cursor_line = 1,
}

vim.cmd.colorscheme("rosebones")

vim.api.nvim_set_hl(0, "StatusLine", { bg = nil })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = nil })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#e4d3d4" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#e4d3d4" })


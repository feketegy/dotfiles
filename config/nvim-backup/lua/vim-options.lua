vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader= " "

-- disable absolute numbering
vim.o.number = false

-- enable relative numberinf
vim.o.relativenumber = true

-- setup status columns
vim.o.statuscolumn = "%l %r "
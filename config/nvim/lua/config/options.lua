-- Options

local g = vim.g
local o = vim.opt

-- Set leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- Nerd custom font enabled
g.have_nerd_font = true

-- Enable line numbers and relative line numbers
o.number = true
o.relativenumber = true

-- Enable mouse in all modes
o.mouse = 'a'

-- Disable showing the mode on the last line
o.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Break indent
o.breakindent = true

-- Use space to fill the space when tab is inserted, use 2 spaces for a tab
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2

-- Number of spaces to use for an indent
o.shiftwidth = 2

-- Save undo history
o.undofile = true

-- Case-insensitive searching unless \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn
o.signcolumn = 'yes'

-- Set updatetime (after set ms the swap file will be written to disk)
o.updatetime = 250

-- ms to wait for a mapped sequence to complete
o.timeoutlen = 300

-- Splits open direction
o.splitright = true
o.splitbelow = true

-- Hide whitespace chars
o.list = false

-- Preview substitutions in real-time
o.inccommand = 'split'

-- Show which line the cursor is on
o.cursorline = true

-- Lines to keep above and below cursor
o.scrolloff = 10

-- Disable commandline until it is needed
o.cmdheight = 0

-- Define global borders (some plugins still don't take this option in consideration)
o.winborder = 'rounded'

-- Nicer window borders to the sacrifice of one window line (horizontal or vertical)
o.laststatus = 3

-- Change session behavior, this option is needed for the auto-session plugin
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

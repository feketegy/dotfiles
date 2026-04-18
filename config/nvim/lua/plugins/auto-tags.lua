-- Autopairs for HTML

local on = require("utils.vim-pack").on

on({ "BufReadPre", "BufNewFile" }, { src = "https://github.com/windwp/nvim-ts-autotag" })

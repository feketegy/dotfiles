-- Highlight, edit, and navigate code

local M = {
  'nvim-treesitter/nvim-treesitter',
}

M.build = ':TSUpdate'

M.main = 'nvim-treesitter.configs'

M.opts = {

  -- Keep alphabetical order when managing this list
  ensure_installed = {
    'bash',
    'c',
    'css',
    'diff',
    'dockerfile',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'markdown_inline',
    'nginx',
    'php',
    'python',
    'query',
    'regex',
    'scss',
    'svelte',
    'sql',
    'templ',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'xml',
    'yaml',
  },

  auto_install = true,

  -- Enable highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Enable indentation
  indent = {
    enable = true,
    disable = { 'ruby' },
  },

  -- Incrementally select objects by pressing Enter to expand and Backspace to collapse the selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<Enter>',
      node_incremental = '<Enter>',
      scope_incremental = false,
      node_decremental = '<Backspace>',
    },
  },
}

return M

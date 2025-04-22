-- Autocompletion

local M = {
  'saghen/blink.cmp',
}

M.version = '*'
M.lazy = false
M.dependencies = 'rafamadriz/friendly-snippets'

M.opts = {
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
      auto_show_delay_ms = 250,
    },
    ghost_text = {
      enabled = false,
    },
  },
  fuzzy = {
    implementation = 'prefer_rust',
  },
  keymap = {
    preset = 'default',
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-Space>'] = {
      function(cmp)
        cmp.show { providers = { 'snippets' } }
      end,
    },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = { 'accept', 'fallback' },
    ['<C-Up>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-Down>'] = { 'scroll_documentation_down', 'fallback' },
  },
  signature = {
    enabled = true,
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
}

return M

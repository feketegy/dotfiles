-- LSP configs

local M = {
  'neovim/nvim-lspconfig',
}

M.dependencies = { 'saghen/blink.cmp', 'ibhagwan/fzf-lua' }

function M.config()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
      local map = require('config.utils').map
      local fzf = require 'fzf-lua'

      map('<leader>dq', vim.diagnostic.setloclist, 'Open diagnostic quickfix list')
      map('<leader>df', vim.diagnostic.open_float, 'Open diagnostic in floating window')
      map('<leader>ds', fzf.lsp_typedefs, 'Show type definitions')
      map('gr', fzf.lsp_references, 'Show references')
      map('gd', fzf.lsp_definitions, 'Go to definition')
      map('gI', fzf.lsp_implementations, 'Show implementations')
      map('ca', fzf.lsp_code_actions, 'Show code actions')
      map('K', vim.lsp.buf.hover, 'Show info under cursor')

      -- Diagnostic setup
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }
    end,
  })

  vim.api.nvim_create_autocmd('LspDetach', {
    group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
    callback = function(event2)
      vim.lsp.buf.clear_references()
    end,
  })

  -- Wire up the LSPs
  -- Make sure to install LSP servers with brew or npm

  -- true in the args will merge with vim.lsp.make_client_capabilities() table
  local caps = require('blink.cmp').get_lsp_capabilities(nil, true)

  vim.lsp.config('*', {
    capabilities = caps,
  })

  vim.lsp.enable {
    'gopls',
    'lua_ls',
    'html',
    'cssls',
    'cssmodules_ls',
    'tailwindcss-language-server',
    'ts_ls',
    'jsonls',
    'dockerls',
    'intelephense',
    'sqls',
  }
end

return M

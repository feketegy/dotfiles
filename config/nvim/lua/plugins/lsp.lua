-- LSP configs

local M = {
  'neovim/nvim-lspconfig',
}

M.dependencies = { 'saghen/blink.cmp', 'ibhagwan/fzf-lua' }

function M.config()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
      local bufmap = require('config.utils').bufmap

      bufmap('<leader>dq', vim.diagnostic.setloclist, 'Open diagnostic quickfix list', event.buf)
      bufmap('<leader>df', vim.diagnostic.open_float, 'Open diagnostic in floating window', event.buf)
      bufmap('K', vim.lsp.buf.hover, 'Show info under cursor', event.buf)

      bufmap('<leader>ds', function()
        Snacks.picker.lsp_type_definitions()
      end, 'Show type definitions', event.buf)

      bufmap('gr', function()
        Snacks.picker.lsp_references()
      end, 'Show references', event.buf)

      bufmap('gd', function()
        Snacks.picker.lsp_definitions()
      end, 'Go to definition', event.buf)

      bufmap('gI', function()
        Snacks.picker.lsp_implementations()
      end, 'Show implementations', event.buf)

      -- Highlight all instances of a symbol under the cursor if the LSP supports it
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
        local hi_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

        -- highlight
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          group = hi_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        -- clear highlight
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          group = hi_augroup,
          callback = vim.lsp.buf.clear_references,
        })
      end

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

      local client = vim.lsp.get_client_by_id(event2.data.client_id)
      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event2.buf) then
        vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
      end

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

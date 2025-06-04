local M = {}

-- Setup document highlight functionality for LSP clients that support it
local function setup_document_highlight(client, buf)
  if not client.server_capabilities.documentHighlightProvider then
    return
  end

  local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

  -- Highlight references on cursor hold
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = buf,
    group = highlight_augroup,
    callback = vim.lsp.buf.document_highlight,
  })

  -- Clear highlights on cursor move
  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    buffer = buf,
    group = highlight_augroup,
    callback = vim.lsp.buf.clear_references,
  })

  -- Clean up highlights on LSP detach
  vim.api.nvim_create_autocmd('LspDetach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
    callback = function(event)
      vim.lsp.buf.clear_references()
      vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event.buf }
    end,
  })
end

-- Setup inlay hints if supported by the LSP client
local function setup_inlay_hints(client, buf)
  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.keymap.set('n', '<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { buffer = buf, desc = 'Inlay [h]ints' })
  end
end

-- Setup ESLint-specific functionality
local function setup_eslint(client, buf)
  if client.name == 'eslint' then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = buf,
      command = 'LspEslintFixAll',
    })
  end
end

M.setup = function()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then
        return
      end

      -- Setup basic LSP keymaps
      require('custom.lspconfig.keymaps').setup(event.buf)

      -- Setup additional LSP features
      setup_document_highlight(client, event.buf)
      setup_inlay_hints(client, event.buf)
      setup_eslint(client, event.buf)
    end,
  })
end

return M

local M = {}

M.setup = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

  require('mason').setup()

  require('mason-tool-installer').setup {
    ensure_installed = {
      'lua_ls',
      'stylua',
    },
  }

  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local status, server = pcall(require, 'custom.lspconfig.servers.' .. server_name)
        if not status then
          server = {}
        end
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }
end

return M

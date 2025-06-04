local M = {}

M.setup = function()
  require('mason').setup()

  require('mason-tool-installer').setup {
    ensure_installed = {
      'lua_ls',
      'stylua',
    },
  }

  require('mason-lspconfig').setup {
    ensure_installed = {
      'lua_ls',
    },
  }
end

return M

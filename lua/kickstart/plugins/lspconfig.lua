return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = require 'custom.lspconfig.dependencies',
    config = function()
      require('custom.lspconfig.autocommands').setup()
      require('custom.lspconfig.servers').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

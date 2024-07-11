return {
  -- Automatically install LSPs and related tools to stdpath for Neovim
  { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
  'williamboman/mason-lspconfig.nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',

  -- Useful status updates for LSP.
  { 'j-hui/fidget.nvim', opts = {} },

  -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  { 'folke/neodev.nvim', opts = {} },
}

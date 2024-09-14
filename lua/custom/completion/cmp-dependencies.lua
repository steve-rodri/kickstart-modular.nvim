return {
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',

  -- icons
  'onsails/lspkind.nvim',

  -- snippets
  require 'custom.completion.dependencies.LuaSnip',

  -- AI/LLM
  'supermaven-inc/supermaven-nvim',
  require 'custom.completion.dependencies.codeium',

  -- sql completion
  'kristijanhusak/vim-dadbod-completion',
}

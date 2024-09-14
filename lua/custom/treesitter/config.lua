return function(_, opts)
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

  -- Prefer git instead of curl in order to improve connectivity in some environments
  require('nvim-treesitter.install').prefer_git = true

  require('custom.treesitter.parsers').setup()

  require('nvim-treesitter.configs').setup(vim.tbl_deep_extend('force', opts, {
    textobjects = {
      select = require 'custom.treesitter.textobjects.select',
      swap = require 'custom.treesitter.textobjects.swap',
      move = require 'custom.treesitter.textobjects.move',
      lsp_interop = require 'custom.treesitter.textobjects.lsp_interop',
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
  }))
end

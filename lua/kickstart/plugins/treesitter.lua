-- Highlight, edit, and navigate code
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = require 'custom.treesitter.opts',
    config = require 'custom.treesitter.config',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = require 'custom.treesitter.context-config',
  },
}

-- vim: ts=2 sts=2 sw=2 et

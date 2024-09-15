-- Fuzzy Finder (files, lsp, etc)
return {
  -- Telescope Extensions
  'xiyaowong/telescope-emoji.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-telescope/telescope-dap.nvim',

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = require 'custom.telescope.dependencies',
    config = require 'custom.telescope.config',
  },
}

-- vim: ts=2 sts=2 sw=2 et

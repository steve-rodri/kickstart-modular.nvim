-- [[ Configure and install plugins ]]

require('lazy').setup({
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.cmp',
  require 'kickstart.plugins.comment',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.sleuth',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.tokyonight',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.which-key',

  require 'custom.plugins.bufferline',
  -- require 'custom.plugins.catppuccin',
  require 'custom.plugins.colorizer',
  require 'custom.plugins.cmdline',
  require 'custom.plugins.dadbod',
  require 'custom.plugins.dashboard',
  require 'custom.plugins.lab',
  -- require 'custom.plugins.lualine',
  require 'custom.plugins.neoscroll',
  -- require 'custom.plugins.persistence',
  require 'custom.plugins.spectre',
  require 'custom.plugins.trouble',
  require 'custom.plugins.typescript-tools',
  require 'custom.plugins.zoxide',

  -- File Navigation and Management
  -- 'thePrimeagen/harpoon',
  'christoomey/vim-tmux-navigator',

  -- Telescope Extensions
  'xiyaowong/telescope-emoji.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-telescope/telescope-dap.nvim',

  -- Code Editing and Refactoring
  'christoomey/vim-sort-motion',
  'tpope/vim-repeat',

  -- PHP Development
  'jwalton512/vim-blade',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

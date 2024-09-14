-- [[ Configure and install plugins ]]

local lazy_opts = require 'lazy-opts'

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
  require 'custom.plugins.harpoon',
  require 'custom.plugins.lab',
  -- require 'custom.plugins.lualine',
  require 'custom.plugins.neoscroll',
  -- require 'custom.plugins.persistence',
  require 'custom.plugins.spectre',
  require 'custom.plugins.trouble',
  require 'custom.plugins.typescript-tools',
  require 'custom.plugins.zoxide',

  require 'custom.plugins.misc',
}, lazy_opts)

-- vim: ts=2 sts=2 sw=2 et

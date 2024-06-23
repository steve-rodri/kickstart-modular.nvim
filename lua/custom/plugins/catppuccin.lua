return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      background = {
        light = 'auto',
        dark = 'mocha',
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}

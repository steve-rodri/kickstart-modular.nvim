return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom', -- "doom" | "hyper"
      config = {
        week_header = {
          enable = true,
        },
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Recent Files',
            desc_hl = 'String',
            key = 'r',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope oldfiles',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files',
          },
          {
            icon = ' ',
            desc = 'Search Dot-files',
            key = 'd',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files cwd=~/.dot-files',
          },
          { icon = '󰊳 ', desc = 'Update', action = 'Lazy update', key = 'u' },
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          -- {
          --   desc = ' Apps',
          --   group = 'DiagnosticHint',
          --   action = 'Telescope app',
          --   key = 'a',
          -- },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'Telescope find_files cwd=~/.dot-files',
            key = 'd',
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>;', '<cmd>Dashboard<cr>', { desc = '[;] Dashboard', noremap = true })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}

-- Database Management
return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  config = function()
    vim.keymap.set('n', '<leader>td', '<cmd>DBUIToggle<cr>', { desc = '[T]oggle [D]atabase UI' })
  end,
}

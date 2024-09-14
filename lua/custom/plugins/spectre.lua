-- Search and Replace
return {
  'windwp/nvim-spectre',
  event = 'BufRead',
  config = function()
    require('spectre').setup {}
    vim.keymap.set('n', '<leader>os', "<cmd>lua require('spectre').open()<cr>", { desc = '[O]pen [S]pectre Search and Replace' })
  end,
}

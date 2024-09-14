--  In Editor Code Runner
return {
  '0x100101/lab.nvim',
  build = 'cd js && npm ci',
  config = function()
    require('lab').setup {}
    vim.keymap.set('n', '<leader>ol', '<cmd>Lab code run<cr>', { desc = '[O]pen [L]ab Code Runner' })
  end,
}

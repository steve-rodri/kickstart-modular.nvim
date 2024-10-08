return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {}
    vim.opt.termguicolors = true

    vim.keymap.set('n', '<leader>c', '<cmd>bdelete<cr>', { desc = '[c]lose current buffer' })
    vim.keymap.set('n', '<leader>C', '<cmd>bdelete!<cr>', { desc = 'Force [C]lose current buffer' })

    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })

    vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close all buffers to the [l]eft' })
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close all buffers to the [r]ight' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close all [o]ther buffers' })
  end,
}

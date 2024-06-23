--  In Editor Code Runner
return {
  '0x100101/lab.nvim',
  build = 'cd js && npm ci',
  config = function()
    require('lab').setup {}
    vim.keymap.set('n', '<leader>ol', '<cmd>Lab code run<cr>', { desc = '[O]pen [L]ab Code Runner' })
  end,
}

-- wk.mappings["a"] = {
--   name = "Code Runner",
--   s = { "<cmd>Lab code stop<cr>" },
--   r = { "<cmd>Lab code run<cr>" },
--   p = { "<cmd>Lab code panel<cr>" },
-- }

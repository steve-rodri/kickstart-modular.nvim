-- Search and Replace
return {
  'windwp/nvim-spectre',
  event = 'BufRead',
  config = function()
    require('spectre').setup {}
    vim.keymap.set('n', '<leader>os', "<cmd>lua require('spectre').open()<cr>", { desc = '[O]pen [S]pectre Search and Replace' })
  end,
}

-- wk.mappings["S"] = {
--   name = "Search and Replace",
--   o = { "<cmd>lua require('spectre').open()<CR>", "Open" },
--   w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Visual Word" },
--   s = { "<esc>:lua require('spectre').open_visual()<CR>", "Visual" },
--   p = { "viw:lua require('spectre').open_file_search()<cr>", "File Search" }
-- }

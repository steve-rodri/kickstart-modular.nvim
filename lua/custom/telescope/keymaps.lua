-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>f', function()
  builtin.find_files { hidden = true }
end, { desc = '[f]ind file' })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[h]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[k]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.git_files, { desc = '[f]iles (git)' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[s]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'current [w]ord' })
vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = '[t]ext' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[d]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = '[r]ecent files' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[b]uffers' })
vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = 'Resume Telescope Search' })

vim.keymap.set('n', '<leader>sm', '<cmd>Telescope media_files<cr>', { desc = '[m]edia' })
vim.keymap.set('n', '<leader>se', '<cmd>Telescope emoji<cr>', { desc = '[e]moji' })
vim.keymap.set('n', '<leader>sD', '<cmd>Telescope dap<cr>', { desc = '[D]ap' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzy search current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sc', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[c]onfiguration files' })

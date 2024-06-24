-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Set file type to Ruby',
  group = vim.api.nvim_create_augroup('set-filetype-ruby', { clear = true }),
  pattern = { 'Brewfile', 'Podfile' },
  callback = function()
    vim.cmd 'setfiletype ruby'
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Set file type to Blade',
  group = vim.api.nvim_create_augroup('set-filetype-blade', { clear = true }),
  pattern = { '*.blade.php' },
  callback = function()
    vim.cmd 'setfiletype blade'
  end,
})

-- vim: ts=2 sts=2 sw=2 et

return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },

  opts = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = ': ',
    },
    popup = {
      position = {
        row = '10%',
        col = '50%',
      },
      size = {
        width = '20%',
      },
      border = {
        -- style = 'rounded',
      },
      win_options = {
        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
      },
    },
  },

  config = function()
    vim.keymap.set('n', '<CR>', '<cmd>FineCmdline<CR>', { noremap = true })
    vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
  end,
}

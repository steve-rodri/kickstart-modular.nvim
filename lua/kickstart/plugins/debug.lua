return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
    { 'theHamsta/nvim-dap-virtual-text', opts = { virt_text_win_col = 80 } },
    -- Used to read vscode launch.json files
    { 'Joakker/lua-json5', build = './install.sh' },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'delve',
        -- Due to a bug with the latest version of vscode-js-debug, need to lock to specific version
        -- See: https://github.com/mxsdev/nvim-dap-vscode-js/issues/58#issuecomment-2213230558
        'js@v1.76.1',
      },
    }
    require('custom.debug.keymaps').setup(dap, dapui)
    require('custom.debug.ui').setup(dap, dapui)
    require('custom.debug.adapters.vscode_js').setup(dap)
    require('custom.debug.adapters.go').setup()
  end,
}

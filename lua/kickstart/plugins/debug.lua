local dap_utils = require 'custom.dap.utils'

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    dap_utils.setup_mason_nvim_dap()
    dap_utils.setup_keymaps(dap, dapui)
    dap_utils.setup_dap_ui(dap, dapui)
    dap_utils.setup_dap_go()
    dap_utils.setup_dap_vscode_js()
  end,
}

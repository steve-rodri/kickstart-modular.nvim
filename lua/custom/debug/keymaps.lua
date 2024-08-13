local M = {}

local function set_breakpoint_condition(dap)
  return function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  end
end

local function run_with_args(dap)
  return function()
    if vim.fn.filereadable '.vscode/launch.json' then
      local dap_vscode = require 'dap.ext.vscode'
      local vscode_js = require 'custom.debug.adapters.vscode_js'
      vscode_js.load_launchjs(dap_vscode)
    end
    dap.continue()
  end
end

function M.setup(dap, dapui)
  local keymaps = {
    { 'n', '<leader>dc', dap.continue, { desc = 'Debug: Start/[c]ontinue' } },
    { 'n', '<leader>di', dap.step_into, { desc = 'Debug: step [i]nto' } },
    { 'n', '<leader>do', dap.step_over, { desc = 'Debug: step [o]ver' } },
    { 'n', '<leader>dO', dap.step_out, { desc = 'Debug: step [O]ut' } },
    { 'n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle [b]reakpoint' } },
    { 'n', '<leader>dB', set_breakpoint_condition(dap), { desc = 'Debug: Set [B]reakpoint Condition' } },
    { 'n', '<leader>da', run_with_args(dap), { desc = 'Debug: Run with args' } },
    { 'n', '<leader>ds', dapui.toggle, { desc = 'Debug: See last session result' } },
    { 'n', '<leader>du', dapui.toggle, { desc = 'Debug: Open [u]i' } },
  }
  for _, map in ipairs(keymaps) do
    vim.keymap.set(unpack(map))
  end
end

return M

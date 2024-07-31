local M = {}

function M.setup_dap_ui(dap, dapui)
  dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
      icons = {
        pause = '⏸',
        play = '▶',
        step_into = '⏎',
        step_over = '⏭',
        step_out = '⏮',
        step_back = 'b',
        run_last = '▶▶',
        terminate = '⏹',
        disconnect = '⏏',
      },
    },
  }
  dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  dap.listeners.before.event_exited['dapui_config'] = dapui.close
end

function M.setup_keymaps(dap, dapui)
  local function set_breakpoint()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  end
  local keymaps = {
    { 'n', '<leader>dc', dap.continue, { desc = 'Debug: Start/[c]ontinue' } },
    { 'n', '<leader>di', dap.step_into, { desc = 'Debug: step [i]nto' } },
    { 'n', '<leader>dv', dap.step_over, { desc = 'Debug: step o[v]er' } },
    { 'n', '<leader>do', dap.step_out, { desc = 'Debug: step [o]ut' } },
    { 'n', '<leader>tb', dap.toggle_breakpoint, { desc = 'Debug: [t]oggle [b]reakpoint' } },
    { 'n', '<leader>dB', set_breakpoint, { desc = 'Debug: Set [B]reakpoint' } },
    { 'n', '<leader>ds', dapui.toggle, { desc = 'Debug: See last session result' } },
  }
  for _, map in ipairs(keymaps) do
    vim.keymap.set(unpack(map))
  end
end

function M.setup_dap_go()
  require('dap-go').setup { delve = { detached = vim.fn.has 'win32' == 0 } }
end

function M.setup_mason_nvim_dap()
  require('mason-nvim-dap').setup {
    automatic_installation = true,
    handlers = {},
    ensure_installed = { 'delve', 'js-debug-adapter' },
  }
end

function M.setup_dap_vscode_js()
  local path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter'
  if vim.fn.isdirectory(path) ~= 1 then
    print('Debugger is not installed here: ' .. path)
  end

  require('dap-vscode-js').setup {
    debugger_path = path,
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
  }

  for _, language in ipairs { 'typescript', 'javascript' } do
    require('dap').configurations[language] = {
      {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      },
    }
  end
end

return M

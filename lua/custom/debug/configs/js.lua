local M = {}

M.launch_nodejs = {
  type = 'pwa-node',
  request = 'launch',
  name = 'Launch file',
  program = '${file}',
  cwd = '${workspaceFolder}',
  sourceMaps = true,
  port = 9299,
  protocol = 'inspector',
  console = 'integratedTerminal',
}

M.attach_nodejs = {
  type = 'pwa-node',
  request = 'attach',
  name = 'Attach',
  processId = require('dap.utils').pick_process,
  cwd = '${workspaceFolder}',
  sourceMaps = true,
}

M.launch_jest = {
  type = 'pwa-node',
  request = 'launch',
  name = 'Debug Jest Tests',
  -- trace = true, -- include debugger info
  runtimeExecutable = 'node',
  runtimeArgs = {
    './node_modules/jest/bin/jest.js',
    '--runInBand',
  },
  rootPath = '${workspaceFolder}',
  cwd = '${workspaceFolder}',
  console = 'integratedTerminal',
  internalConsoleOptions = 'neverOpen',
}

function M.web_processes(url)
  return {
    type = 'pwa-chrome',
    request = 'launch',
    name = 'Launch & Debug Chrome',
    url,
    webRoot = '${workspaceFolder}',
    skipFiles = { '<node_internals>/**/*.js' },
    protocol = 'inspector',
    sourceMaps = true,
    userDataDir = false,
    cwd = '${workspaceFolder}',
  }
end

return M

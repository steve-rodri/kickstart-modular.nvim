local M = {}

local js_based_languages = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }

function M.setup(dap)
  local path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter'
  if vim.fn.isdirectory(path) ~= 1 then
    print('Debugger is not installed here: ' .. path)
  end

  require('dap-vscode-js').setup {
    debugger_cmd = { path .. '/js-debug-adapter' },
  }

  local configs = require 'custom.debug.configs.js'
  local launch_json = require 'custom.debug.configs.launch_json'

  for _, language in ipairs(js_based_languages) do
    dap.configurations[language] = {
      configs.launch_nodejs,
      configs.launch_vitest,
      configs.attach_nodejs,
      configs.web_processes(),
      launch_json,
    }
  end
end

function M.load_launchjs(dap_vscode)
  dap_vscode.load_launchjs(nil, {
    ['pwa-node'] = js_based_languages,
    ['pwa-chrome'] = js_based_languages,
    ['node'] = js_based_languages,
    ['chrome'] = js_based_languages,
  })
end

return M

local M = {}

function M.setup(dap)
  dap.adapters.nlua = function(callback, config)
    callback { type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 }
  end
  dap.configurations.lua = require 'custom.debug.configs.nlua'
end

return M

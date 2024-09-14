local M = {}

function M.setup()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  ---@diagnostic disable-next-line: inject-field
  parser_config.blade = {
    install_info = {
      url = 'https://github.com/EmranMR/tree-sitter-blade',
      files = { 'src/parser.c' },
      branch = 'main',
    },
    filetype = 'blade',
  }
end

return M

local M = {}

function M.setupFormatting()
  local lspkind = require 'lspkind'
  return {
    format = lspkind.cmp_format {
      mode = 'symbol',
      max_width = 50,
      symbol_map = { Supermaven = '' },
    },
  }
end

function M.setupSnippet(luasnip)
  return {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  }
end

function M.setupSources()
  return {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'codeium' },
    { name = 'vim-dadbod-completion' },
    { name = 'supermaven' },
  }
end

return M

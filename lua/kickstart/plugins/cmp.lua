local dependencies = require 'custom.completion.cmp-dependencies'
local opts = require 'custom.completion.cmp-opts'
local util = require 'custom.completion.cmp-util'
local setupMapping = require 'custom.completion.cmp-setupMapping'

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = dependencies,
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      formatting = util.setupFormatting(),
      mapping = setupMapping(cmp, luasnip),
      snippet = util.setupSnippet(luasnip),
      sources = util.setupSources(),
    }
  end,
  opts = opts,
}
-- vim: ts=2 sts=2 sw=2 et

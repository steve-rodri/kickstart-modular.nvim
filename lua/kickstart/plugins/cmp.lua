local util = require 'custom.completion.cmp-util'

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = util.getDependencies(),
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      formatting = util.setupFormatting(),
      mapping = util.setupMapping(cmp, luasnip),
      snippet = util.setupSnippet(luasnip),
      sources = util.setupSources(),
    }
  end,
  opts = util.getOpts(),
}
-- vim: ts=2 sts=2 sw=2 et

return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  opts = {},
}

-- Known issue with comments in jsx, temporarily solved with ts_context_commentstring above
-- https://github.com/numToStr/Comment.nvim/pull/133

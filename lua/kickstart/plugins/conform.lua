-- local tsjs = { 'biome', 'prettier', 'prettierd' }
local tsjs = { 'prettier', 'prettierd' }

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,

      default_format_opts = {
        lsp_format = 'fallback',
        stop_after_first = true,
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },

      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = tsjs,
        javascriptreact = tsjs,
        typescript = tsjs,
        typescriptreact = tsjs,
        json = tsjs,
        markdown = function()
          local formatters = {}
          if tsjs then
            for _, v in ipairs(tsjs) do
              table.insert(formatters, v)
            end
          end
          table.insert(formatters, 1, 'mdslw')
          return formatters
        end,
        yaml = function()
          local formatters = {}
          if tsjs then
            for _, v in ipairs(tsjs) do
              table.insert(formatters, v)
            end
          end
          table.insert(formatters, 1, 'yamlfmt')
          return formatters
        end,
        sql = { 'sql-formatter' },
        sh = { 'beautysh' },
        zsh = { 'beautysh' },
        ['*'] = { 'codespell' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

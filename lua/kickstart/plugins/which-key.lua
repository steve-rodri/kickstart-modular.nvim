-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = '[L]sp', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
        ['<leader>e'] = { name = '[E]xplorer', _ = 'which_key_ignore' },
        ['<leader>o'] = { name = '[O]pen', _ = 'which_key_ignore' },
        ['<leader>x'] = { name = '[X] Trouble', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffers', _ = 'which_key_ignore' },
      }
      -- visual mode
      require('which-key').register({
        ['<leader>g'] = { '[G]it' },
      }, { mode = 'v' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

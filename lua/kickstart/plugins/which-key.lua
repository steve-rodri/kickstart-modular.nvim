-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>b', group = '[B]uffers' },
      { '<leader>b_', hidden = true },
      { '<leader>d', group = '[D]ebug' },
      { '<leader>d_', hidden = true },
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>e_', hidden = true },
      { '<leader>g', group = '[G]it' },
      { '<leader>g_', hidden = true },
      { '<leader>l', group = '[L]sp' },
      { '<leader>l_', hidden = true },
      { '<leader>o', group = '[O]pen' },
      { '<leader>o_', hidden = true },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>t_', hidden = true },
      { '<leader>x', group = '[X] Trouble' },
      { '<leader>x_', hidden = true },
    }

    -- visual mode
    require('which-key').add({
      { '<leader>g', desc = '[G]it', mode = 'v' },
    }, { mode = 'v' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et

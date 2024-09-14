local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

-- This repeats the last query with always previous direction and to the start of the range.
vim.keymap.set({ 'n', 'x', 'o' }, '<home>', function()
  ts_repeat_move.repeat_last_move { forward = false, start = true }
end)

-- This repeats the last query with always next direction and to the end of the range.
vim.keymap.set({ 'n', 'x', 'o' }, '<end>', function()
  ts_repeat_move.repeat_last_move { forward = true, start = false }
end)

-- example: make gitsigns.nvim movement repeatable with ; and , keys.
local gs = require 'gitsigns'

-- make sure forward function comes first
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
-- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

vim.keymap.set({ 'n', 'x', 'o' }, ']h', next_hunk_repeat)
vim.keymap.set({ 'n', 'x', 'o' }, '[h', prev_hunk_repeat)

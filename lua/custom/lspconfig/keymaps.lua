local M = {}

M.setup = function(buf)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
  end

  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ld', require('telescope.builtin').lsp_document_symbols, '[D]ocument Symbols')
  map('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace Symbols')
  map('<leader>lr', vim.lsp.buf.rename, '[R]ename')
  map('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

return M

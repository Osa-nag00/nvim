-- lua/config/keymaps.lua

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Center cursor after half-page scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor after moving down half-page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor after moving up half-page' })

-- Treat :W as :w
vim.api.nvim_create_user_command('W', 'w', { bang = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setloclist {
    format = function(diagnostic)
      local namespace = vim.diagnostic.get_namespace(diagnostic.namespace)
      if namespace.name:find('nvim.lsp.typos_lsp.', 1, true) then
        return nil
      end
      return diagnostic.message
    end,
  }
end, { desc = 'Open diagnostic list without typos' })

-- Exit terminal mode shortcut
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

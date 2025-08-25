return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
  },
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

  vim.keymap.set('n', '<leader>o', function()
    local oil = require 'oil'
    oil.open_float()
  end, { desc = '[O]pen Oil' }),

  vim.keymap.set('n', '<leader>oc', function()
    local oil = require 'oil'
    oil.close {
      exit_if_last_buf = true,
    }
  end, { desc = '[O]il Close' }),
}

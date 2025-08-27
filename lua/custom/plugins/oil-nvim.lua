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
    oil.open()
  end, { desc = '[O]pen Oil' }),

  vim.keymap.set('n', '<leader>oc', function()
    local oil = require 'oil'
    if vim.bo.filetype == 'oil' then
      oil.close {}
      vim.cmd 'Dashboard'
      local bufId = vim.api.nvim_get_current_buf()
      require('ibl').setup_buffer(bufId, { enabled = false })
    end
  end, { desc = '[O]il Close' }),
}

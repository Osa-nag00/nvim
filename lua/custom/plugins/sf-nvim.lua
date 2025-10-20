return {
  'xixiaofinland/sf.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
    'stevearc/overseer.nvim',
  },

  config = function()
    require('sf').setup {}
  end,

  vim.keymap.set('n', '<leader>stt', '<cmd>:SF term toggle<cr>', { desc = 'Close sf integrated terminal' }),
}

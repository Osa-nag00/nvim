return {
  'xixiaofinland/sf.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
    'stevearc/overseer.nvim',
  },

  config = function()
    require('sf').setup { terminal = 'overseer' }
    require('overseer').setup()
  end,
}

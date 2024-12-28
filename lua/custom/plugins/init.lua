-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- lazy git integraton
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    -- keys = {
    --   { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    -- },
    -- setting keymap for lazy git
    vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = '[L]azy [G]it' }),
  },

  -- gen doc text for current line
  { 'kkoomen/vim-doge', vim.keymap.set('n', '<Leader>dd', '<Plug>(doge-generate)') },
}

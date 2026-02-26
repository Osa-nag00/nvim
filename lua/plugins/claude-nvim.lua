return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = true,
  keys = {
    { '<leader>a', nil, desc = 'AI/Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    -- Diff management
    {
      '<leader>aa',
      function()
        local diff = require('claudecode.diff')
        local tab_name = vim.b[vim.api.nvim_get_current_buf()].claudecode_diff_tab_name
        diff.accept_current_diff()
        if tab_name then
          diff.close_diff_by_tab_name(tab_name)
        end
      end,
      desc = 'Accept diff',
    },
    {
      '<leader>ad',
      function()
        local diff = require('claudecode.diff')
        local tab_name = vim.b[vim.api.nvim_get_current_buf()].claudecode_diff_tab_name
        diff.deny_current_diff()
        if tab_name then
          diff.close_diff_by_tab_name(tab_name)
        end
      end,
      desc = 'Deny diff',
    },
  },
}

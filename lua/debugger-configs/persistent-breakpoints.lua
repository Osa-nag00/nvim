return {
  'Weissle/persistent-breakpoints.nvim',
  dependencies = { 'mfussenegger/nvim-dap' },
  event = 'BufReadPost',
  opts = {
    load_breakpoints_event = { 'BufReadPost' },
  },
}

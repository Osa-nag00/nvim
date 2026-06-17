return {
  'jay-babu/mason-nvim-dap.nvim',
  dependencies = { 'mason-org/mason.nvim', 'mfussenegger/nvim-dap' },
  opts = {
    ensure_installed = { 'js-debug-adapter', 'debugpy' },
    automatic_installation = true,
    handlers = {},
  },
}

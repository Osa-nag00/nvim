return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = { 'lua_ls', 'harper_ls', 'html' },
    },
  },
  { 'rshkarin/mason-nvim-lint', opts = {} },
}

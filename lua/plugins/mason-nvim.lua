return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        -- 'bashls',
        -- 'apex-language-server',
        -- 'black',
        -- 'debugpy',
        -- 'html',
        -- 'jq',
        -- 'lua_ls',
        -- 'markdownlint',
        -- 'pyright',
        -- 'shellcheck',
        -- 'stylua',
        -- 'terragrunt_ls',
        -- 'tofu_ls',
        -- 'ts_ls',
        -- 'typos_lsp',
      },
    },
  },
  { 'rshkarin/mason-nvim-lint', opts = {} },
}

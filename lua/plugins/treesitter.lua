return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  init = function()
    vim.treesitter.language.register('terraform', 'terraform-vars')
    vim.treesitter.language.register('terraform', 'tfvars')
  end,
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'diff',
      'dockerfile',
      'git_config',
      'gitcommit',
      'gitignore',
      'html',
      'java',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'regex',
      'sql',
      'terraform',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
      'apex'
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = false },
  },
  -- config = function(_, opts)
  --   require('nvim-treesitter.configs').setup(opts)
  -- end,
}

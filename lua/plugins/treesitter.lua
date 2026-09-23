return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  init = function()
    -- for filetypes that want to be troublesome
    vim.treesitter.language.register('terraform', {
      'terraform-vars', -- standard .tfvars filetype
      'tfvars',
    })

    vim.treesitter.language.register('apex', {
      'cls',
      'trigger',
    })
    vim.treesitter.language.register('soql', { 'soql', 'sosl' })

    -- activate tree sitter highlighting autcommand for every file
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        -- Salesforce
        'apex',
        'cls',
        'trigger',
        'soql',
        'sosl',

        -- Terraform / infrastructure
        'terraform',
        'terraform-vars',
        'tfvars',
        'hcl',
        'dockerfile',

        -- Shell and configuration
        'sh',
        'bash',
        'zsh',
        'json',
        'jsonc',
        'yaml',
        'toml',
        'xml',

        -- Programming
        'lua',
        'python',
        'java',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'html',
        'css',
        'sql',

        -- Neovim and documentation
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',

        -- Git
        'gitcommit',
        'gitrebase',
        'diff',
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  opts = {
    -- auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    { 'echasnovski/mini.snippets', version = '*', dependencies = { 'rafamadriz/friendly-snippets' } },
    'abeldekat/cmp-mini-snippets',
  },
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpNormal', { bg = '#494d64' })

    local cmp = require 'cmp'
    local miniSnippets = require 'mini.snippets'

    local gen_loader = miniSnippets.gen_loader
    miniSnippets.setup {
      snippets = {
        gen_loader.from_lang {},
      },
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          local insert = miniSnippets.config.expand.insert or miniSnippets.default_insert
          -- TODO: come back and configure this maybe
          insert { body = args.body, opts = {} } -- Insert at cursor
          cmp.resubscribe { 'TextChangedI', 'TextChangedP' }
          require('cmp.config').set_onetime { sources = {} }
        end,
      },

      completion = { completeopt = 'menu,menuone,noinsert' },

      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      },

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'mini_snippets' },
      }, {
        { name = 'buffer' },
      }),
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
      matching = {
        disallow_symbol_nonprefix_matching = false,
        disallow_fuzzy_matching = false,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
      },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config('*', {
      capabilities = capabilities,
      root_markers = { '*' },
    })
  end,
}

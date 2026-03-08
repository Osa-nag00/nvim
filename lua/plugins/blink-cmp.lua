return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = { 'rafamadriz/friendly-snippets' },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  opts = {
    keymap = {
      preset = 'none',
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'cancel', 'fallback' },
      ['<C-y>'] = { 'select_and_accept' },
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = { auto_show = true },
    },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
    snippets = { preset = 'default' },
  },

  opts_extend = { 'sources.default' },
  config = function(_, opts)
    local blink = require 'blink.cmp'
    blink.setup(opts)
    vim.lsp.config('*', {
      capabilities = blink.get_lsp_capabilities(),
      root_markers = { '.git' },
    })
  end,
}

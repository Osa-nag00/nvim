-- Plugins for anything related to frontend dev stuff

return {
  -- {
  --   'nvim-ts-autotag',
  --   config = function()
  --     require('nvim-ts-autotag').setup {
  --       opts = {
  --         -- Defaults
  --         enable_close = true, -- Auto close tags
  --         enable_rename = true, -- Auto rename pairs of tags
  --         enable_close_on_slash = false, -- Auto close on trailing </
  --       },
  --       -- Also override individual filetype configs, these take priority.
  --       -- Empty by default, useful if one of the "opts" global settings
  --       -- doesn't work well in a specific filetype
  --       per_filetype = {
  --         ['html'] = {
  --           enable_close = false,
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- some stuff I stole to setup up nice typescript tools
  {
    'pmizio/typescript-tools.nvim',
    event = 'LspAttach',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      {
        'saghen/blink.cmp',
        -- Ensure blink.cmp is loaded before typescript-tools
        lazy = false,
        priority = 1000,
      },
    },
  },

  {
    'razak17/tailwind-fold.nvim',
    opts = {
      min_chars = 50,
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact' },
  },

  {
    'MaximilianLloyd/tw-values.nvim',
    keys = {
      { '<Leader>cv', '<CMD>TWValues<CR>', desc = 'Tailwind CSS values' },
    },
    opts = {
      show_unknown_classes = true, -- Shows the unknown classes popup
    },
  },

  {
    'laytan/tailwind-sorter.nvim',
    cmd = {
      'TailwindSort',
      'TailwindSortOnSaveToggle',
    },
    keys = {
      { '<Leader>cS', '<CMD>TailwindSortOnSaveToggle<CR>', desc = 'toggle Tailwind CSS classes sort on save' },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = true,
  },

  {
    'axelvc/template-string.nvim',
    event = 'InsertEnter',
    ft = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
    },
    config = true, -- run require("template-string").setup()
  },

  {
    'dmmulroy/tsc.nvim',
    cmd = { 'TSC' },
    config = true,
  },

  {
    'dmmulroy/ts-error-translator.nvim',
    config = true,
  },
}

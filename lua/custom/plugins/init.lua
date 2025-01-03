-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- lazy git integraton
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    -- keys = {
    --   { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    -- },
    -- setting keymap for lazy git
    vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = '[L]azy [G]it' }),
  },

  -- gen doc text for current line
  { 'kkoomen/vim-doge', vim.keymap.set('n', '<Leader>dd', '<Plug>(doge-generate)') },

  -- plugin for word subsitutions in buffers
  {
    'gbprod/substitute.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    -- these keymaps work with whats in the yank buffer
    vim.keymap.set('n', 's', "<cmd>lua require('substitute').operator()<cr>", { noremap = true }),
    vim.keymap.set('n', 'ss', "<cmd>lua require('substitute').line()<cr>", { noremap = true }),
    vim.keymap.set('n', 'S', "<cmd>lua require('substitute').eol()<cr>", { noremap = true }),

    -- these keymaps work off of motions <motion1> <leader>[] <mation2>
    vim.keymap.set('n', '<leader>s', "<cmd>lua require('substitute.range').operator()<cr>", { noremap = true }),
    vim.keymap.set('x', '<leader>s', "<cmd>lua require('substitute.range').visual()<cr>", { noremap = true }),
    vim.keymap.set('n', '<leader>ss', "<cmd>lua require('substitute.range').word()<cr>", { noremap = true }),
  },

  -- catppuccin plugin for neovim themes
  {
    'catppuccin/nvim', -- Plugin source
    config = function()
      -- Catppuccin theme setup
      require('catppuccin').setup {
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }

      -- Apply the colorscheme
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- plugin for nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
      }
    end,
  },
}

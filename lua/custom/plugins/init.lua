return {
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
    -- vim.keymap.set('n', 's', '', { noremap = true }),
    vim.keymap.set('n', 'ss', "<cmd>lua require('substitute').line()<cr>", { noremap = true }),
    -- vim.keymap.set('n', 'S', "<cmd>lua require('substitute').eol()<cr>", { noremap = true }),

    -- these keymaps work off of motions <motion1> <leader>[] <mation2>
    -- vim.keymap.set('n', '<leader>s', "<cmd>lua require('substitute.range').operator()<cr>", { noremap = true }),
    vim.keymap.set('x', '<leader>s', "<cmd>lua require('substitute.range').visual()<cr>", { noremap = true }),
    -- vim.keymap.set('n', '<leader>ss', "<cmd>lua require('substitute.range').word()<cr>", { noremap = true }),
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
          group_empty = false,
          icons = {
            web_devicons = {
              file = {
                enable = true,
                color = true,
              },
              folder = {
                enable = false,
                color = true,
              },
            },
            glyphs = {
              default = '',
              symlink = '',
              bookmark = '󰆤',
              modified = '●',
              hidden = '󰜌',
              folder = {
                arrow_closed = '',
                arrow_open = '',
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
                symlink_open = '',
              },
              git = {
                unstaged = '✗',
                staged = '✓',
                unmerged = '',
                renamed = '➜',
                untracked = '★',
                deleted = '',
                ignored = '◌',
              },
            },
          },
        },
        filters = {
          git_ignored = true,
        },
      }
    end,
  },

  -- show keys on screen with :Screenkey
  {
    'NStefan002/screenkey.nvim',
    lazy = false,
    version = '*', -- or branch = "dev", to use the latest commit
  },

  -- lua with lazy.nvim
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup()
    end,
  },
}

return {
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
}

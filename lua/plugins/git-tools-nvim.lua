return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {

    'f-person/git-blame.nvim',
    event = 'VeryLazy',

    opts = {
      enabled = true,
      date_format = '%Y-%m-%d %H:%M',
      blame_line = true,
      ignore_whitespace = false,
      virtual_text_pos = 'eol',
      delay = 1000,
      relative_time = false,
      max_line_length = 120,
      min_window_width = 70,
      override_url_format = nil,
      custom_arguments = {},
      preview_config = {
        border = 'single',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },
}

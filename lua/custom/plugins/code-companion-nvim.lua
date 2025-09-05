-- Markview configuration
local markview_opts = {
  preview = {
    filetypes = { 'markdown', 'codecompanion' },
    ignore_buftypes = {},
  },
  experimental = {
    check_rtp_message = false,
  },
}

-- Mini.diff configuration
local function setup_mini_diff()
  local diff = require 'mini.diff'
  diff.setup {
    -- Disabled by default
    source = diff.gen_source.none(),
  }
end

return {
  'olimorris/codecompanion.nvim',
  opts = {
    provider = 'copilot',
    model = 'gpt-5',
    enable_chat = true,
    enable_code = true,
  },
  dependencies = {
    -- AI and utility plugins
    'github/copilot.vim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',

    -- Markdown preview
    {
      'OXY2DEV/markview.nvim',
      lazy = false,
      opts = markview_opts,
    },

    -- Diff viewer
    {
      'echasnovski/mini.diff',
      config = setup_mini_diff,
    },
  },
}

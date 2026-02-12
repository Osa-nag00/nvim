return {

  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    local cmp = require 'cmp'

    cmp.event:on('menu_opened', function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on('menu_closed', function()
      vim.b.copilot_suggestion_hidden = false
    end)

    require('copilot').setup {
      copilot_model = 'gpt-41-copilot',
      suggestion = {
        enabled = false,
        auto_trigger = false,
        keymap = {
          accept = '<S-Tab>',
          accept_word = false,
          accept_line = false,
        },
      },
    }
  end,
}

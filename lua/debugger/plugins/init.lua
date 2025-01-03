-- this custom init file is for debugger plugins and things related to that nature
return {

  -- nvim-dap debug asapter protocol
  {
    'mfussenegger/nvim-dap',
    config = function() end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
      require('mason-nvim-dap').setup {
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      }
    end,
  },

  { 'nvim-neotest/nvim-nio' },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dap.listeners.after['dap.event.initialize'] = function()
        dapui.open()
      end

      dap.listeners.before['dap.event.terminated'] = function()
        dapui.close()
      end

      -- Set up DAP UI keybindings
      vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", { noremap = true })
      vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", { noremap = true })
      vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", { noremap = true })
      vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
    end,
  },
}

-- this custom init file is for debugger plugins and things related to that nature
return {

  -- plugin for nvim dap
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F6>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F7>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F8>', function()
        require('dap').step_out()
      end)
      vim.keymap.set('n', '<M-b>', function()
        require('dap').toggle_breakpoint()
      end)

      -- altering the styles of dap visuals
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

      -- start of dap configs for c/c++/rust
      -- dap.adapters.gdb = {
      --   type = 'executable',
      --   command = 'gdb',
      --   args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
      -- }

      dap.configurations.c = {
        {
          name = 'Launch',
          type = 'gdb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopAtBeginningOfMainSubprogram = false,
        },
      }
      -- end of dap configs for c/c++/rust
    end,
  },

  -- plugin to add virtual text support next to src code when debugging
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup()
    end,
  },

  -- plugin for dap UI
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
        vim.cmd 'NvimTreeResize 30'
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()

        vim.cmd 'NvimTreeResize 30'
      end

      require('dapui').setup()
    end,
  },

  -- NOTE: this also needs to be loaded after mason has been loaded
  -- pluging mason integration with nvim dap
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
      require('mason-nvim-dap').setup {
        ensure_installed = {},
        handlers = {},
        automatic_installation = false,
      }
    end,
  },

  -- NOTE: Below is for language specific daps

  -- plugin for dap for python
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      require('dap-python').setup 'python3'
    end,
  },
}

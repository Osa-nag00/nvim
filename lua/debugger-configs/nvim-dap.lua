return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')
    dap.defaults.fallback.switchbuf = 'usevisible,uselast'

    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff5555', bold = true })
    vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#ffb86c', bold = true })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#8be9fd', bold = true })
    vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#6272a4', bold = true })
    vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#f1fa8c', bold = true })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#3a3a1f' })
    vim.api.nvim_set_hl(0, 'DapStoppedNum', { fg = '#f1fa8c', bg = '#3a3a1f', bold = true })

    local sign = vim.fn.sign_define
    sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    sign('DapBreakpointCondition', { text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
    sign('DapBreakpointRejected', { text = '✖', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
    sign('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = 'DapStoppedNum' })

    local map = function(lhs, rhs, desc) vim.keymap.set('n', lhs, rhs, { desc = desc, silent = true }) end
    map('<leader>db', function() require('persistent-breakpoints.api').toggle_breakpoint() end, 'DAP: toggle breakpoint')
    map('<leader>dB', function() require('persistent-breakpoints.api').set_conditional_breakpoint() end, 'DAP: conditional breakpoint')
    map('<leader>dw', function() vim.cmd('DapViewWatch ' .. vim.fn.expand('<cword>')) end, 'DAP: watch word under cursor')
  end,
}

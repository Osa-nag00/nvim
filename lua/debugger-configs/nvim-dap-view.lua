return {
  'igorlfs/nvim-dap-view',
  version = '1.x',
  opts = {
    auto_toggle = true,
    winbar = {
      sections = { 'watches', 'scopes', 'exceptions', 'breakpoints', 'threads', 'console' },
      controls = {
        enabled = true,
      },
    },
    windows = { size = 0.50, position = 'right', terminal = { position = 'below', hide = true } },
  },
}

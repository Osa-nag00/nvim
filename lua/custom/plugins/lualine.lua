return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'palenight',
    },
    sections = { lualine_c = { 'filename', { "require'sf'.get_target_org()" } } },
  },
}

local printTargetOrg = function()
  local sf = require 'sf'
  local target_org = sf.get_target_org()
  return '[[' .. (target_org or 'No Target Org Set') .. ']]'
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'palenight',
    },
    sections = { lualine_c = { 'filename', { printTargetOrg } } },
  },
}

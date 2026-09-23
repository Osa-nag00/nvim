return {
  -- gen doc text for current line
  'kkoomen/vim-doge',
  init = function()
    vim.g.doge_doc_standard_python = 'google'
  end,
  -- keys = {
  --   { '<Leader>dd', '<Plug>(doge-generate)', desc = 'Generate documentation' },
  -- },
}

return {
  -- gen doc text for current line
  'kkoomen/vim-doge',
  vim.keymap.set('n', '<Leader>dd', '<Plug>(doge-generate)'),
}

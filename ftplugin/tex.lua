-- call async job to compile latex on buf save
vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function()
    local buf_full_path = vim.api.nvim_buf_get_name(0)
    vim.fn.jobstart('pdflatex ' .. buf_full_path)
  end,
})

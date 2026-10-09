-- call async job to compile latex on buf save
vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  buffer = 0,
  callback = function(args)
    local buf_full_path = vim.api.nvim_buf_get_name(args.buf)
    local buf_dir = vim.fn.fnamemodify(buf_full_path, ':h')
    -- run in the tex file's directory so the pdf (and aux/log files) end up next to it
    vim.fn.jobstart({
      'pdflatex',
      '-output-directory=' .. buf_dir,
      buf_full_path,
    }, { cwd = buf_dir })
  end,
})

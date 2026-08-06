return {
  -- typos-lsp must be on your PATH, or otherwise change this to an absolute path to typos-lsp
  -- defaults to typos-lsp if unspecified
  cmd = { 'typos-lsp' },
  -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
  cmd_env = { RUST_LOG = 'typos_lsp=error' },
}

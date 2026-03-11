return {
  'neovim/nvim-lspconfig',
  config = function()
    -- Filetype detection (not LSP-dependent, should always apply)
    vim.filetype.add {
      pattern = {
        ['docker%-compose%.ya?ml'] = 'yaml.docker-compose',
        ['compose%.ya?ml'] = 'yaml.docker-compose',
        ['%.gitlab%-ci%.ya?ml'] = 'yaml.gitlab',
        ['.*%.email'] = 'html',
        ['.*%.cls'] = 'apex',
      },
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local builtin = require 'telescope.builtin'

        vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
        vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
        vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { desc = 'Type [D]efinition' })
        vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
        vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
        vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if vim.g.have_nerd_font then
          local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
          local diagnostic_signs = {}
          for type, icon in pairs(signs) do
            diagnostic_signs[vim.diagnostic.severity[type]] = icon
          end
          vim.diagnostic.config { signs = { text = diagnostic_signs } }
        end
      end,
    })
  end,
}

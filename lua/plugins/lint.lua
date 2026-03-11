return {
  -- Linting
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
      shell = { 'shellcheck' },
      -- terraform = { 'terraform' },
      -- yaml = { 'yamllint' },
      -- lua = { 'selene' },
    }

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify in order to
        -- avoid superfluous noise, notably within the handy LSP pop-ups that
        -- describe the hovered symbol using Markdown.
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })

    -- vim.api.nvim_create_user_command('LintInfo', function()
    --   local running = lint.get_running()
    --   if #running == 0 then
    --     vim.notify('No linters running', vim.log.levels.INFO)
    --   else
    --     vim.notify('Running linters: ' .. table.concat(running, ', '), vim.log.levels.INFO)
    --   end
    -- end, {})
  end,
}

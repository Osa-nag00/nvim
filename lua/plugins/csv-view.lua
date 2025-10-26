return {
  {
    'hat0uma/csvview.nvim',

    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { '#', '//' } },
      keymaps = {
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
        jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
      },
    },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },

    init = function()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
        pattern = '*.csv',
        callback = function()
          local csvView = require 'csvview'
          local winid = vim.api.nvim_get_current_win()
          local bufId = vim.api.nvim_get_current_buf()
          vim.wo[winid].wrap = false

          if not csvView.is_enabled(bufId) then
            csvView.enable(bufId, {
              view = {
                display_mode = 'border',
                header_lnum = 1,
                sticky_header = { enabled = true },
              },
            })
          end
        end,
      })
    end,
  },
}

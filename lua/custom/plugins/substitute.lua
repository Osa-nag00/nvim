return {

}

-- return {
--
--   -- plugin for word subsitutions in buffers
--   {
--     'gbprod/substitute.nvim',
--     opts = {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     },
--
--     -- these keymaps work with whats in the yank buffer
--     -- vim.keymap.set('n', 's', '', { noremap = true }),
--     vim.keymap.set('n', 'ss', "<cmd>lua require('substitute').line()<cr>", { noremap = true }),
--     -- vim.keymap.set('n', 'S', "<cmd>lua require('substitute').eol()<cr>", { noremap = true }),
--
--     -- these keymaps work off of motions <motion1> <leader>[] <mation2>
--     -- vim.keymap.set('n', '<leader>s', "<cmd>lua require('substitute.range').operator()<cr>", { noremap = true }),
--     vim.keymap.set('x', '<leader>s', "<cmd>lua require('substitute.range').visual()<cr>", { noremap = true }),
--     -- vim.keymap.set('n', '<leader>ss', "<cmd>lua require('substitute.range').word()<cr>", { noremap = true }),
--   },
-- }

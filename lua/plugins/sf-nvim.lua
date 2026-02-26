return {
  'xixiaofinland/sf.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
    -- 'stevearc/overseer.nvim',
  },

  config = function()
    require('sf').setup {

      -- the folder this plugin uses to store intermediate data. It's under the sf project root directory.
      plugin_folder_name = '.sf/sf_nvim_cache/',

      -- Define what metadata to be listed in `list_md_to_retrieve()` (<leader>ml)
      -- Salesforce has numerous metadata types. We narrow down the scope of `list_md_to_retrieve()`.
      types_to_retrieve = {
        'ApexClass',
        'ApexTrigger',
        'LightningComponentBundle',
        'AuraDefinitionBundle',
        'StaticResource',
        'CustomObject',
        'CustomField',
        'CustomMetadata',
        'CustomLabels',
        'Profile',
        'PermissionSet',
        'PermissionSetGroup',
        'Layout',
        'ValidationRule',
        'AssignmentRule',
        'Flow',
        'EmailTemplate',
        'Report',
        'ReportType',
        'Dashboard',
        'NamedCredential',
        'RemoteSiteSetting',
        'ConnectedApp',
        'Queue',
      },

      -- Configuration for the integrated terminal
      term_config = {
        ft = 'SFTerm', -- term filetype
        blend = 5, -- background transparency: 0 is fully opaque; 100 is fully transparent
        dimensions = {
          height = 0.4, -- proportional of the editor height. 0.4 means 40%.
          width = 0.8, -- proportional of the editor width. 0.8 means 80%.
          x = 0.5, -- starting position of width. Details in `get_dimension()` in raw_term.lua source code.
          y = 0.9, -- starting position of height. Details in `get_dimension()` in raw_term.lua source code.
        },
        -- `:h jobstart-options` for below options
        border = 'rounded', -- 'single'|'double'|'rounded'|'shadow'|false
        hl = 'NormalFloat', -- let the colorscheme (catppuccin) color the float background
        float_border_hl = 'FloatBorder',
        clear_env = false,
        pty = true, -- use a pty/terminal if you're running CLI tools
        winblend = 0, -- transparency
      },
    }

    local Sf = require 'sf'
    vim.keymap.set('n', '<leader>stt', Sf.toggle_term, { desc = 'Toggle sf integrated terminal' })
    vim.keymap.set('n', '<leader>ml', Sf.list_md_to_retrieve, { desc = 'List metadata to retrieve' })
    vim.keymap.set('n', '<leader>mt', Sf.list_md_type_to_retrieve, { desc = 'List metadata types to retrieve' })
    vim.keymap.set('n', '<leader>df', Sf.save_and_push, { desc = 'Save and then Deploy current file in buffer' })
    vim.keymap.set('n', '<leader>rr', Sf.run_all_tests_in_this_file, { desc = 'Run Test in current file' })
  end,
}

return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup {
      settings = {
        java = {
          configurations = {
            runtimes = {
              name = 'java-17',
              path = '/home/onaghise/.sdkman/candidates/java/current/bin/java',
              default = 'true',
            },
          },
        },
      },
    }
    vim.lsp.enable 'jdtls'
  end,
}

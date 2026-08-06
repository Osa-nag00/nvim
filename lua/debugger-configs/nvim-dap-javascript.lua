return {
  'mxsdev/nvim-dap-vscode-js',

  config = function()
    require('dap-vscode-js').setup {
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath 'data' .. '/mason/bin/js-debug-adapter', -- Path to vscode-js-debug installation.
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    }

    for _, language in ipairs { 'typescript', 'javascript' } do
      require('dap').adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          -- 💀 Make sure to update this path to point to your installation
          args = { vim.fn.stdpath('data').."/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", '${port}' },
        },
      }

      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
          console = 'internalConsole',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch ts-node',
          runtimeExecutable = 'node',
          runtimeArgs = { '-r', 'ts-node/register' },
          program = '${file}',
          cwd = '${workspaceFolder}',
          console = 'internalConsole',
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
        },
        {
          -- For standalone ts-node CLI scripts (e.g. commander commands that call
          -- program.parse(process.argv) at the top level, like the pcsa dsf2 tools).
          -- Runs the current .ts file via the project-local ts-node, from the file's
          -- own project root, and prompts for the subcommand + flags to pass.
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch ts-node CLI (prompt args)',
          runtimeExecutable = 'node',
          runtimeArgs = { '-r', 'ts-node/register' },
          program = '${file}',
          -- cwd = the nearest dir containing package.json/tsconfig.json above the file,
          -- so ts-node resolves the right tsconfig and node_modules (not nvim's cwd).
          cwd = function()
            local file = vim.fn.expand('%:p')
            return vim.fs.root(file, { 'tsconfig.json', 'package.json' }) or vim.fn.getcwd()
          end,
          -- Prompt for args each run, e.g. "createuser --target-org scratch-org -f data/x.csv -s scratch -d com"
          args = function()
            local input = vim.fn.input('CLI args: ')
            return vim.split(input, ' ', { trimempty = true })
          end,
          console = 'integratedTerminal',
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          sourceMaps = true,
          resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }
    end
  end,
}

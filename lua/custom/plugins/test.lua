return {
  {
    'folke/which-key.nvim',
    optional = true,
    opts = { defaults = { ['<leader>x'] = { name = '+test' } } },
  },
  {
    'nvim-neotest/neotest',
    version = 'v5.9.*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'MisanthropicBit/neotest-jest', -- "nvim-neotest/neotest-jest", https://github.com/nvim-neotest/neotest-jest/pull/111
    },
    config = function(_, _)
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            jestConfigFile = 'jest.config.js',
            dap = {
              justMyCode = false,
              -- dap_config_name = "Debug Jest Tests",
            },
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
      }
    end,
    keys = {
      {
        '<leader>xt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File',
      },
      {
        '<leader>xT',
        function()
          require('neotest').run.run(vim.loop.cwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>xr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>xd',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = 'Debug Nearest',
      },
      {
        '<leader>xs',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary',
      },
      {
        '<leader>xo',
        function()
          require('neotest').output.open {
            enter = true,
            auto_close = true,
          }
        end,
        desc = 'Show Output',
      },
      {
        '<leader>xO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel',
      },
      {
        'leader>xS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop',
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = { ensure_installed = { 'js-debug-adapter' } },
      },
      { 'theHamsta/nvim-dap-virtual-text', opts = {} },
      {
        'folke/which-key.nvim',
        optional = true,
        opts = {
          defaults = {
            ['<leader>d'] = { name = '+debug' },
            ['<leader>da'] = { name = '+adapters' },
          },
        },
      },
      {
        'rcarriga/nvim-dap-ui',
        keys = {
          {
            '<leader>du',
            function()
              require('dapui').toggle {}
            end,
            desc = 'Dap UI',
          },
          {
            '<leader>de',
            function()
              require('dapui').eval()
            end,
            desc = 'Eval',
            mode = { 'n', 'v' },
          },
        },
        opts = {},
        config = function(_, opts)
          local dap = require 'dap'
          local dapui = require 'dapui'
          dapui.setup(opts)
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open {}
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close {}
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close {}
          end
        end,
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { { 'williamboman/mason.nvim' } },
        cmd = { 'DapInstall', 'DapUninstall' },
        opts = {
          automatic_installation = true,
          -- see mason-nvim-dap README for more information
          handlers = {},
          ensure_installed = {
            'js-debug-adapter',
          },
        },
        config = function(_, opts)
          require('mason-nvim-dap').setup(opts)
        end,
      },
    },
    config = function()
      local dap = require 'dap'

      -- dap.defaults.fallback.pythonPath = require('raven.utils').venv_python_path()

      local mason_path = vim.fn.stdpath 'data' .. '/mason'

      dap.adapters.lldb = {
        type = 'executable',
        command = mason_path .. '/packages/codelldb/codelldb',
        name = 'codelldb',
      }

      if not dap.adapters['pwa-node'] then
        require('dap').adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = { mason_path .. '/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
          },
        }
      end
      if not dap.adapters['node'] then
        dap.adapters['node'] = function(cb, config)
          if config.type == 'node' then
            config.type = 'pwa-node'
          end
          local nativeAdapter = dap.adapters['pwa-node']
          if type(nativeAdapter) == 'function' then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local js_filetypes = { 'typescript', 'javascript' }

      local vscode = require 'dap.ext.vscode'
      vscode.type_to_filetypes['node'] = js_filetypes
      vscode.type_to_filetypes['pwa-node'] = js_filetypes

      dap.configurations.typescript = {
        {
          name = 'Debug (start:dev)',
          type = 'pwa-node',
          request = 'launch',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'tsx', '--env-file=.env', 'src/main.ts' },
          console = 'integratedTerminal',
        },
        {
          name = 'Debug (watch start:dev)',
          type = 'pwa-node',
          request = 'launch',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'tsx', 'watch', '--env-file=.env', 'src/main.ts' },
          console = 'integratedTerminal',
        },
        {
          name = 'Debug (nest)',
          type = 'pwa-node',
          request = 'launch',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'nest', 'start' },
          console = 'integratedTerminal',
        },
        {
          name = 'Debug (watch nest)',
          type = 'pwa-node',
          request = 'launch',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'nest', 'start', '--watch' },
          console = 'integratedTerminal',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
        },
        {
          name = 'Debug Tests (current file)',
          type = 'pwa-node',
          request = 'launch',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'jest', '${file}', '--runInBand', '--no-cache', '--watchAll=false' },
          console = 'integratedTerminal',
        },
      }

      dap.configurations.javascript = dap.configurations.typescript
    end,
    keys = {
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Breakpoint Condition',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle Breakpoint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Continue',
      },
      {
        '<leader>dC',
        function()
          require('dap').run_to_cursor()
        end,
        desc = 'Run to Cursor',
      },
      {
        '<leader>dg',
        function()
          require('dap').goto_()
        end,
        desc = 'Go to line (no execute)',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'Step Into',
      },
      {
        '<leader>dj',
        function()
          require('dap').down()
        end,
        desc = 'Down',
      },
      {
        '<leader>dk',
        function()
          require('dap').up()
        end,
        desc = 'Up',
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = 'Run Last',
      },
      {
        '<leader>dO',
        function()
          require('dap').step_out()
        end,
        desc = 'Step Out',
      },
      {
        '<leader>do',
        function()
          require('dap').step_over()
        end,
        desc = 'Step Over',
      },
      {
        '<leader>dp',
        function()
          require('dap').pause()
        end,
        desc = 'Pause',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.toggle()
        end,
        desc = 'Toggle REPL',
      },
      {
        '<leader>ds',
        function()
          require('dap').session()
        end,
        desc = 'Session',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate',
      },
      {
        '<leader>dw',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = 'Widgets',
      },
    },
  },
}

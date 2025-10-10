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
}

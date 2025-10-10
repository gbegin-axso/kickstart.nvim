return {
  { 'github/copilot.vim' },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    opts = {
      mode = 'agentic',
      provider = 'copilot',
      providers = {
        copilot = {
          -- model = "claude-sonnet-4"
          model = 'gpt-4.1',
        },
      },
      hints = { enabled = false },
      web_search_engine = {
        provider = 'google',
      },
      selector = {
        exclude_auto_select = { 'NvimTree' },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    keys = {
      {
        '<leader>a+',
        function()
          local tree_ext = require 'avante.extensions.nvim_tree'
          tree_ext.add_file()
        end,
        desc = 'Select file in NvimTree',
        ft = 'NvimTree',
      },
      {
        '<leader>a-',
        function()
          local tree_ext = require 'avante.extensions.nvim_tree'
          tree_ext.remove_file()
        end,
        desc = 'Deselect file in NvimTree',
        ft = 'NvimTree',
      },
    },
    dependencies = {
      'zbirenbaum/copilot.lua',
      -- Required
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'echasnovski/mini.pick', -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}

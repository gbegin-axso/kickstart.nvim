return {
  {
    {
      'nvim-neotest/neotest',
      keys = {
        { '<leader>tt', "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<CR>", desc = '[T]rigger [T]est' },
      },
      dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
      },
    },
  },
}

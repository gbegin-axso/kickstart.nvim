return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    keys = {
      { '<leader>tn', '<cmd>Neotree toggle<CR>', desc = '[T]oggle [N]eotree' },
    },
    opts = {
      filesystem = {
        open_on_setup = true,
      },
    },
    lazy = false,
  },
}

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      require('onedark').load()
    end,
  },
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
  { 'folke/which-key.nvim', opts = {} },
  { 'github/copilot.vim' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-commentary' },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      -- lsp_keymaps = false,
      -- other options
    },
    config = function(lp, opts)
      require('go').setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      { '<leader>ta', '<cmd>AutoSession search<CR>', desc = '[T]oggle [A]uto-session' },
    },
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      session_lens = {
        picker = nil,
        mappings = {
          delete_session = { 'i', '<C-d>' },
          alternate_session = { 'i', '<C-s>' },
          copy_session = { 'i', '<C-y>' },
        },
        load_on_setup = true,
      },
    },
  },
  {
    'mbbill/undotree',
    keys = {
      { '<leader>tu', '<cmd>UndotreeToggle<CR>', desc = '[T]oggle [U]ndotree' },
    },
  },
}

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.o.clipboard = ''

vim.opt.colorcolumn = '80'

require 'custom.plugins.onedark'
require 'custom.plugins.neotree'
require 'custom.plugins.copilot'
require 'custom.plugins.tpope'
require 'custom.plugins.lsp'
require 'custom.plugins.autosession'
require 'custom.plugins.undotree'
require 'custom.plugins.autosave'
require 'custom.plugins.diffview'

return {}

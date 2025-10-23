-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.number = true
vim.opt.relativenumber = true

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

require 'custom.plugins.theme'
require 'custom.plugins.neotree'
require 'custom.plugins.copilot'
require 'custom.plugins.tpope'
require 'custom.plugins.lsp'
require 'custom.plugins.autosession'
require 'custom.plugins.undotree'
require 'custom.plugins.autosave'
require 'custom.plugins.diffview'
require 'custom.plugins.test'
require 'custom.plugins.nvim-treesitter'

-- add custom keys to vim

vim.keymap.set('v', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>yy', '"*yy', { desc = 'Yank line to system clipboard' })

-- Window and tab navigation
vim.keymap.set('n', 'sp', ':sp<CR>', { desc = 'Open current buffer in horizontal split' })
vim.keymap.set('n', 'vs', ':vs<CR>', { desc = 'Open current buffer in vertical split' })
vim.keymap.set('n', 'tj', ':tabprev<CR>', { desc = 'Switch to previous tab' })
vim.keymap.set('n', 'tk', ':tabnext<CR>', { desc = 'Switch to next tab' })
vim.keymap.set('n', 'tn', ':tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', 'to', ':tabo<CR>', { desc = 'Close other tabs' })
vim.keymap.set('n', 'tc', ':tabc<CR>', { desc = 'Close current tab' })

-- Diagnostic navigation
vim.keymap.set('n', '<leader>j', ':cnext<CR>', { desc = 'Next diagnostic', silent = true })
vim.keymap.set('n', '<leader>k', ':cprevious<CR>', { desc = 'Previous diagnostic', silent = true })

-- Map toggle to a key
vim.keymap.set('n', '<space><del>', ':bd<CR>', { desc = '[D]elete [C]urrent buffer', noremap = true, silent = true })
vim.keymap.set('n', '<C-LeftMouse>', vim.lsp.buf.definition, { desc = 'Go to [D]efinition with Cmd+LeftClick', noremap = true, silent = true })
vim.keymap.set('n', '<C-RightMouse>', vim.lsp.buf.implementation, { desc = 'Go to [I]mplementation with Right Click', noremap = true, silent = true })

return {}

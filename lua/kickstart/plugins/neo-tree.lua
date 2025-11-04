-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last open window
    popup_border_style = 'rounded', -- Rounded borders for popups
    enable_git_status = true, -- Show git status icons
    enable_diagnostics = true, -- Show diagnostics icons like errors and warnings f
    filesystem = {
      open_on_setup = true,
      follow_current_file = { enabled = true },
      window = {

        position = 'right',
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}

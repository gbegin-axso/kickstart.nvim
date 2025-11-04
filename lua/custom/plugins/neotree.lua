return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<leader>tn', '<cmd>Neotree toggle<CR>', desc = '[T]oggle [N]eotree' },
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
        },
      },

      -- Default components configuration, including icons
      default_component_configs = {
        indent = { padding = 0, strict = true },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '󰜌',
          default = '',
        },
      },
    },
  },
}

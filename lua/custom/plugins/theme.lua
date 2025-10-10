return {
  {
    enabled = false,
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
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- ensures it loads early
    config = function()
      require('catppuccin').setup {
        flavour = 'latte', -- choose latte flavor
        background = {
          light = 'latte',
          dark = 'mocha', -- fallback dark theme
        },
        transparent_background = false,
        show_end_of_buffer = false,
        -- Add additional configs if needed
      }
      -- Apply the colorscheme after setup
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}

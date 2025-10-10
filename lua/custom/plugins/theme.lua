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
    enabled = false,
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
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000, -- load early
    config = function()
      require('monokai-pro').setup {
        filter = 'classic', -- Choose classic flavor
        -- Add additional configuration options if needed
        transparent_background = false,
        terminal_colors = true,
        devicons = true,
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
}

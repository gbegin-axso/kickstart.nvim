-- Toggle between light and dark Catppuccin themes
local current_flavour = 'mocha'

local function toggle_catppuccin()
  if current_flavour == 'mocha' then
    current_flavour = 'latte'
  else
    current_flavour = 'mocha'
  end
  require('catppuccin').setup { flavour = current_flavour }
  vim.cmd.colorscheme 'catppuccin'
end

vim.keymap.set('n', '<leader>tc', toggle_catppuccin, { desc = '[T]oggle [C]atppuccin theme', noremap = true, silent = true })

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
    enabled = true,
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- ensures it loads early
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
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
    enabled = false,
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

-- -- Toggle between light and dark Catppuccin themes
-- local current_flavour = 'mocha'

-- local function toggle_catppuccin()
--   if current_flavour == 'mocha' then
--     current_flavour = 'latte'
--   else
--     current_flavour = 'mocha'
--   end
--   require('catppuccin').setup { flavour = current_flavour }
--   vim.cmd.colorscheme 'catppuccin'
-- end

-- vim.keymap.set('n', '<leader>tc', toggle_catppuccin, { desc = '[T]oggle [C]atppuccin theme', noremap = true, silent = true })

return {
  {
    enabled = true,
    'loctvl842/monokai-pro.nvim',
    priority = 1000, -- load early
    config = function()
      require('monokai-pro').setup {
        filter = 'pro', -- Choose classic flavor
        -- Add additional configuration options if needed
        transparent_background = false,
        terminal_colors = true,
        devicons = true,
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
}

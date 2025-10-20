return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        -- Optionally add your custom configuration here,
        -- For example, enable the plugin or set max_lines, separator, etc.
        enable = true,
        max_lines = 0,
        line_numbers = true,
        mode = 'cursor',
      }
    end,
  },
}

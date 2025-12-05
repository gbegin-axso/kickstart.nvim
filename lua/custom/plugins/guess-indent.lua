return {
  "nmac427/guess-indent.nvim",
  event = "BufReadPre",  -- or "VeryLazy"
  config = function()
    require("guess-indent").setup({})
  end,
}

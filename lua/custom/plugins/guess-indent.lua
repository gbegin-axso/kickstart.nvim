return {
  "nmac427/guess-indent.nvim",
  event = "BufReadPre",
  config = function()
    require("guess-indent").setup({
      auto_cmd = true,          -- run on BufRead
      override_editorconfig = false,
    })
  end,
}

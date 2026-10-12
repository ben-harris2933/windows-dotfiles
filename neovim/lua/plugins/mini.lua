return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.icons").setup()
      require("mini.tabline").setup({
        show_icons = true,
        tabpage_section = "left",
      })
    end,
  },
}

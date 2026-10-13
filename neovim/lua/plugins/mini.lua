return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.icons").setup()
      require("mini.tabline").setup({
        show_icons = true,
        tabpage_section = "left",
      })

      vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = "#ffffff", bg = "#005f87", bold = true })
      vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = "#ffffff", bg = "#d76f00", bold = true })
    end,
    keys = {
      { "<A-.>", "<cmd>bnext<CR>", desc = "Next buffer" },
      { "<A-,>", "<cmd>bprevious<CR>", desc = "Previous buffer" },
      { "<A-c>", "<cmd>bdelete<CR>", desc = "Close buffer" },
    },
  },
}

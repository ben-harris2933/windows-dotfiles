return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").setup({})
  end,
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>t", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
  },
}

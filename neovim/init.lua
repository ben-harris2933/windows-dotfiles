require("config.lazy")

local opt = vim.opt

opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 4
opt.scrolloff = 3

vim.g.mapleader = " ";
vim.keymap.set("n", "<A-.>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-,>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<A-c>", "<cmd>bdelete<CR>", { desc = "Close buffer" })

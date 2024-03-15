vim.g.mapleader = " "
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.relativenumber = true
vim.o.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.scrolloff = 8
vim.o.termguicolors = true

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set("n", "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set("n", "<C-p>", "<cmd>bprev<CR>", {})
vim.keymap.set("n", "<C-A-d>", "<cmd>bdelete<CR>", {})
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", {})
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", {})
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", {})
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", {})
vim.keymap.set("n", "<C-A-v>", "<cmd>vs<CR>", {})
vim.keymap.set("n", "<C-A-s>", "<cmd>split<CR>", {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd([[colorscheme catppuccin]])

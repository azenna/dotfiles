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

-- buffer commands
vim.keymap.set("n", "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set("n", "<C-p>", "<cmd>bprev<CR>", {})
vim.keymap.set("n", "<C-e>", "<cmd>bdelete<CR>", {})

-- quickfix commansds
vim.keymap.set("n", "<C-q>", "<cmd>copen<CR>", {})
vim.keymap.set("n", "<C-A-q>", "<cmd>cclose<CR>", {})

-- location commands
vim.keymap.set("n", "<C-l>", "<cmd>lopen<CR>", {})
vim.keymap.set("n", "<C-A-l>", "<cmd>lclose<CR>", {})

-- custom commands
vim.api.nvim_create_user_command("Writing", function()
	vim.cmd([[ZenMode | Pencil | set spell]])
end, {})

vim.api.nvim_create_user_command("WritingOff", function()
	vim.cmd([[ZenMode | PencilOff | spell&]])
end, {})

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

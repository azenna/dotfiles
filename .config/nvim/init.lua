vim.g.mapleader = " "
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.scrolloff = 8
vim.o.termguicolors = true
-- disables netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.grepprg = 'rg --vimgrep'

-- quickfix commansds
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", {})
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", {})
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>", {})
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>", {})

-- tag commands
vim.keymap.set("n", "<C-A-]>", "<cmd>tn<CR>", {})
vim.keymap.set("n", "<C-A-[>", "<cmd>tp<CR>", {})

RT_CW = ''
vim.keymap.set("n", "<C-]>", function()
  local cw = vim.fn.expand("<cword>")
  if cw ~= RT_CW then
    vim.fn.execute("tag " .. cw)
  elseif not pcall(vim.cmd, "tnext") then
      vim.cmd[[trewind]]
  end
  RT_CW = cw
  vim.fn.search(cw, 'c', vim.fn.line('.'))
end, {})

-- location commands
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<CR>", {})
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<CR>", {})
vim.keymap.set("n", "<C-A-n>", "<cmd>lnext<CR>", {})
vim.keymap.set("n", "<C-A-l>", "<cmd>lprevious<CR>", {})

-- split commands
vim.keymap.set("n", "<leader>v", "<cmd>vs<CR>", {})
vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", {})

-- custom commands
vim.api.nvim_create_user_command("Writing", function()
	vim.cmd([[ZenMode | Pencil | set spell]])
end, {})

vim.api.nvim_create_user_command("WritingOff", function()
	vim.cmd([[ZenMode | PencilOff | spell&]])
end, {})

-- lsp stuff
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gy', vim.lsp.codelens.run, opts)
  end,
})

vim.keymap.set("n", "<leader>g", "<cmd>silent grep! <cword> | copen<CR>", {})

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

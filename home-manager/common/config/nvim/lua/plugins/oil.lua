return {
	"stevearc/oil.nvim",
	opts = {},
	init = function()
		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}

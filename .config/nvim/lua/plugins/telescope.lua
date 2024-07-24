return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
					},
				},
			})
		end,
		init = function()
			require("telescope").load_extension("file_browser")
			local telescope_api = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", telescope_api.find_files, {})
			vim.keymap.set("n", "<leader>fg", telescope_api.live_grep, {})
			vim.keymap.set("n", "<leader>fb", telescope_api.buffers, {})
			vim.keymap.set("n", "<leader>fh", telescope_api.help_tags, {})
			vim.keymap.set("n", "<leader>fs", telescope_api.grep_string, {})
			vim.keymap.set("n", "<leader>t", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}

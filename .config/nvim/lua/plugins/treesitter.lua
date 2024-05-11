return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"zig",
				"nix",
				"vimdoc",
				"query",
				"rust",
				"go",
				"cpp",
				"haskell",
				"ocaml",
				"proto",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}

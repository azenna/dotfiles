return {
	"nvim-neorg/neorg",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.ui"] = {}, -- Adds pretty icons to your documents
				["core.ui.calendar"] = {},
				["core.esupports.hop"] = {},
			},
		})
	end,
}

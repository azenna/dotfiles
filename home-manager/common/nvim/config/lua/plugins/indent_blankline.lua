return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local highlight = {
			"Red",
			"Violet",
			"Orange",
			"Cyan",
			"Yellow",
			"Blue",
			"Green",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Red", { fg = "#f38ba8" })
			vim.api.nvim_set_hl(0, "Violet", { fg = "#cba6f7" })
			vim.api.nvim_set_hl(0, "Orange", { fg = "#fab387" })
			vim.api.nvim_set_hl(0, "Yellow", { fg = "#f9e2af" })
			vim.api.nvim_set_hl(0, "Blue", { fg = "#89b4fa" })
			vim.api.nvim_set_hl(0, "Green", { fg = "#a6e3a1" })
			vim.api.nvim_set_hl(0, "Cyan", { fg = "#94e2d5" })
		end)

		require("ibl").setup({ indent = { highlight = highlight }, scope = { enabled = false } })
	end,
}

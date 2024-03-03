return {
	"jbyuki/nabla.nvim",
	init = function()
		vim.keymap.set("n", "<leader>na", function()
			require("nabla").popup()
		end, {})
	end,
}

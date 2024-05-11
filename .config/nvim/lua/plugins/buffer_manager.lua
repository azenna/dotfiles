return {
	"j-morano/buffer_manager.nvim",
	opts = {},
	init = function()
		local bmui = require("buffer_manager.ui")
		vim.keymap.set("n", "<leader>bm", bmui.toggle_quick_menu, {})
	end,
}

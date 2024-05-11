return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local lspconfigs = require("lspconfig.configs")
		local lsputil = require("lspconfig.util")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.rust_analyzer.setup({
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {},
			},
		})
		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.hls.setup({ capabilities = capabilities })
		lspconfig.pyright.setup({ capabilities = capabilities })
		lspconfig.tsserver.setup({ capabilities = capabilities })
		lspconfig.nil_ls.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.jsonls.setup({ capabilities = capabilities })
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.ocamllsp.setup({ capabilities = capabilities })
	end,
	init = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
			end,
		})
	end,
}

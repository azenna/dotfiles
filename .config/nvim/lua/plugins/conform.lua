return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			-- Conform will run multiple formatters sequentially
			python = { "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { "prettier" },
			rust = { "rustfmt" },
			haskell = { "fourmolu" },
			cpp = { "clang_format" },
			nix = { "alejandra" },
			ocaml = { "ocamlformat" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		formatters = {
			fourmolu = {
				prepend_args = { "--indentation", "2" },
			},
		},
	},
}

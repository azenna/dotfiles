return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local lspconfigs = require("lspconfig.configs")
    local lsputil = require("lspconfig.util")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    lspconfig.rust_analyzer.setup({
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ["rust-analyzer"] = {},
      },
    })
    lspconfig.clangd.setup({ capabilities = capabilities })
    -- lspconfig.hls.setup({ capabilities = capabilities })
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.tsserver.setup({ capabilities = capabilities })
    lspconfig.nil_ls.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.jsonls.setup({ capabilities = capabilities })
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.ocamllsp.setup({ capabilities = capabilities })
    lspconfig.gleam.setup({ capabilities = capabilities })
  end,
}

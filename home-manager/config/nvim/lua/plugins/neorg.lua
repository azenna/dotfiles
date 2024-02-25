return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.ui"] = {}, -- Adds pretty icons to your documents
        ["core.esupports.hop"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
              log = "~/notes/log",
              learning = "~/notes/learning",
              school = "~/notes/learning/school",
            },
          },
        },
      },
    })
  end,
}

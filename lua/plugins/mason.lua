return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "tailwindcss",
      }
    }
    require("mason-tool-installer").setup {
      ensure_installed = {
        "stylua",
        "tsserver",
        "tailwindcss",
      }
    }
  end
}

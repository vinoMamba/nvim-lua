return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      local mason = require("mason")
      mason.setup({})
      
      local alones = {}
      local servers = {}
      local installServers = {}

      local list = require("plugins.lsp.ensure_list")
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local default_config = require("plugins.lsp.default_config")
      
      for _, ele in pairs(list) do
        table.insert(installServers, ele.name)
          if ele.alone then
            table.insert(alones, ele.name)
          else
            table.insert(servers, ele.name)
          end
      end

      local servers_handlers = {}

      for _, value in pairs(servers) do
        local status, config = pcall(require, "plugins.lsp.config." .. value)
        if not status then
          config = {}
        end
        servers_handlers[value] = function()
          lspconfig[value].setup(vim.tbl_deep_extend("force", default_config(), config))
        end
      end

      mason_lspconfig.setup({
        ensure_installed = installServers,
        handlers = servers_handlers,
      })
    end,
  }
}

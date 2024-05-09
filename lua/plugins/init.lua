return {
  --overwrite
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require("configs.mason")
    end
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("configs.treesitter")
    end,
  },
  -- custom
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
}

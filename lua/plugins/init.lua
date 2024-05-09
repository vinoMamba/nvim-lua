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
  {
    "airblade/vim-rooter",
    lazy = false,
    init = function()
      local project = require("configs.project")
      project.init()
    end
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local golang = require("configs.golang")
      golang.config()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = function()
      local flash = require("configs.flash")
      return flash.keyBinding()
    end
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = function()
      local trouble = require("configs.trouble")
      return trouble.keybinding()
    end
  },
  {
    "kdheepak/lazygit.nvim",
    keys = { "<leader>la" },
    config = function()
      local lazygit = require("configs.lazygit")
      lazygit.config()
    end
  },
}

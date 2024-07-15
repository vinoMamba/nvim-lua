return {
  --disabled
  { "stevearc/conform.nvim", enabled = true },
  { "folke/which-key.nvim",  enabled = false },


  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local opts = require "nvchad.configs.nvimtree"
      local mine = {
        view = {
          adaptive_size = false,
          side = "right",
          width = 30,
          preserve_window_proportions = true,
        },
      }
      return vim.tbl_deep_extend("force", opts, mine)
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "airblade/vim-rooter",
    lazy = false,
    init = function()
      vim.g.rooter_patterns = { '__vim_project_root', '.git/' }
      vim.g.rooter_silent_chdir = true
      -- set an autocmd
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          -- source .vim.lua at project root
          vim.cmd([[silent! source .vim.lua]])
        end,
      })
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("configs.golang")
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}

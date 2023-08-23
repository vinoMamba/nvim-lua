return {
  -- {
  --   "theniceboy/nvim-deus",
  --   "catppuccin/nvim",
  --   config = function()
  --     vim.cmd [[colorscheme deus]]
  --   end
  -- },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
      })
      vim.cmd [[colorscheme catppuccin]]
    end,
  }
}

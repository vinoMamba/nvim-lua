return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
          disable = {}, -- list of language that will be disabled
        },
        indent = {
          enable = true
        },
      }
    end
  }
}

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting =false,
          disable = {}, -- list of language that will be disabled
        },
        indent = {
          enable = true
        },
        context_commentstring = {
          enable = true,
        },
      }
    end
}

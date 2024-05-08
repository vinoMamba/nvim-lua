return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  opts = {
    chunk = {
      enable = true,
      use_treesitter = true,
      style = {
        { fg = "#a9dc76" },
      },
    },
    indent = {
      chars = { "│", "¦", "┆", "┊", },
      use_treesitter = false,
    },
    blank = {
      enable = false,
    },
    line_num = {
      use_treesitter = true,
    },
  }
}

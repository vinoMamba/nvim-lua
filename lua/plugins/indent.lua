return {
 "shellRaining/hlchunk.nvim",
    init = function()
      require('hlchunk').setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = "#87afaf" },
          },
        },
        indent = {
          enable = false,
          chars = { "│", "¦", "┆", "┊", },
          use_treesitter = false,
          style = {
            "#FF0000",
            "#FF7F00",
            "#FFFF00",
            "#00FF00",
            "#00FFFF",
            "#0000FF",
            "#8B00FF",
          },
        },
        blank = {
          enable = false,
        },
        line_num = {
          use_treesitter = true,
          style = {
            { fg = "#87afaf" },
          },
        },
      })
    end
}

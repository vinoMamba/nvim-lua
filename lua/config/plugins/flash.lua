return {
	"folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    {
      "\\",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "f=",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
					search = { forward = true, wrap = false, mult_window = false},
				})
      end,
      desc = "Flash",
    },
    {
      "f-",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
					search = { forward = false, wrap = false, mult_window = false},
				})
      end,
      desc = "Flash",
    },
    {
      "<leader><leader>t",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}

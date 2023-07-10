return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		search = {
			multi_window = false
		},
		label = {
		},
		char = {
		}
	},
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
			"ff",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({ continue = true }) -- 显示上次的搜索内容
			end,
			desc = "Flash",
		},
	},
}

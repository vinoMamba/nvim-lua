return {
	-- "rebelot/kanagawa.nvim",
	"theniceboy/nvim-deus",
	lazy = false,
	priority = 1000,
	config = function()
		-- setup must be called before loading
		vim.cmd([[colorscheme deus]])
	end
	--
	-- 'AlexvZyl/nordic.nvim',
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require 'nordic'.load()
	-- end
}

return {
	-- "ajmwagar/vim-deus",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[colorscheme deus]])
	-- end
	'AlexvZyl/nordic.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require 'nordic'.load()
	end
}

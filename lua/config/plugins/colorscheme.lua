return {
	{
		"theniceboy/nvim-deus",
		lazy = false,
		priority = 1000,
		config = function()
			-- setup must be called before loading
			vim.cmd([[colorscheme deus]])
		end
	},
}

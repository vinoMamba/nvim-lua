return {
	{
		-- Rooter changes the working directory to the project root when you open a file or directory.
		"airblade/vim-rooter",
		init = function()
			vim.g.rooter_patterns = { '__vim_project_root', '.git/' }
			vim.g.rooter_silent_chdir = true
			-- set an autocmd
			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					-- source .nvim.lua at project root
					vim.cmd([[silent! source .vim.lua]])
				end,
			})
		end
	},
}

return {
  {
	  "theniceboy/joshuto.nvim",
	  very_lazy = true,
	  cmd = "Joshuto",
	  config = function()
		  vim.g.joshuto_floating_window_scaling_factor = 1.0
		  vim.g.joshuto_use_neovim_remote = 1
		  vim.g.joshuto_floating_window_winblend = 0
	  end
  },
  {
    "Eandrju/cellular-automaton.nvim",
	  keys = "<leader>rr",
	  config = function()
		  vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>")
	  end,
  }
}

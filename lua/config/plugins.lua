local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("config.plugins.colorscheme"),
	require("config.plugins.editor"),
	require("config.plugins.comment"),
	require("config.plugins.treesitter"),
	require("config.plugins.mason"),
	require("config.plugins.autocomplete").config,
	require("config.plugins.lspconfig").config,
	require("config.plugins.debugger"),
	require("config.plugins.indent"),
	require("config.plugins.joshuto"),
	require("config.plugins.notify"),
	require("config.plugins.rooter"),
	require("config.plugins.statusbar"),
	require("config.plugins.tabline"),
	require("config.plugins.flash"),
	require("config.plugins.telescope"),
})

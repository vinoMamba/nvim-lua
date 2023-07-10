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
	require("config.plugins.colorscheme"), --主题
	require("config.plugins.editor"),     -- 编辑器相关
	require("config.plugins.comment"),    -- 注释
	require("config.plugins.treesitter"),
	require("config.plugins.indent"),
	require("config.plugins.rooter"),   -- 设置工作目录
	require("config.plugins.statusbar"), -- 底部信息栏
	require("config.plugins.tabline"),  -- tab 切换
	require("config.plugins.joshuto"),
	require("config.plugins.flash"),
	require("config.plugins.notify"),
	require("config.plugins.telescope"),

	require("config.plugins.mason"),
	require("config.plugins.autocomplete").config,
	require("config.plugins.lspconfig").config,
	require("config.plugins.debugger"),
})

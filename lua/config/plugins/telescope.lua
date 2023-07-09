local m = { noremap = true, nowait = true }
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 
			'nvim-lua/plenary.nvim' ,
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>fr', builtin.resume, m) -- 恢复上一次查询的参数
			vim.keymap.set('n', '<leader>fo', builtin.oldfiles, m)
			vim.keymap.set('n', '<leader>ff', builtin.find_files, m)
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, m)
			vim.keymap.set('n', '<leader>fb', builtin.buffers, m)
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, m)
			vim.keymap.set('n', ':', builtin.commands, m)
		end
}

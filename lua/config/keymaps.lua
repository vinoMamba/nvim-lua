vim.g.mapleader = " "

vim.keymap.set({'n','v'},'S','<cmd>w<cr>',{ silent = true, noremap = true} )
vim.keymap.set({'n','v'},'Q','<cmd>q<cr>',{ silent = true, noremap = true } )
vim.keymap.set({'n','v'},';',':')
vim.keymap.set({'v'},'Y','\"+y',{ silent = true, noremap = true } )
vim.keymap.set({'n','v'},'`','~',{ silent = true, noremap = true } )
vim.keymap.set({'i'},'jk','<Esc>',{ silent = true, noremap = true } )
vim.keymap.set({'n','v'},'L','$',{ silent = true, noremap = true } )
vim.keymap.set({'n','v'},'H','^',{ silent = true, noremap = true } )
vim.keymap.set({'n','v'},'K','8k',{ silent = true, noremap = true } )
vim.keymap.set({'n','v'},'J','8j',{ silent = true, noremap = true } )

-- forbidden
vim.keymap.set({'n'},'s','<Nop>',{ silent = true, noremap = true } )

-- tab
vim.keymap.set({'n'},'<leader><Tab>','<cmd>bNext<cr>',{ silent = true, noremap = true } )

-- windows split [only left and right]
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true , noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true , noremap = true })
vim.keymap.set("n", "sl", "<cmd>:set nosplitright<CR>:vsplit<CR>:set splitright<CR>", { desc = "split to right" })
vim.keymap.set("n", "sj", "<cmd>:set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", { desc = "split to bottom" })
vim.keymap.set("n", "<left>", "<cmd>:vertical resize-5<CR>", { desc = "resize up" })
vim.keymap.set("n", "<right>", "<cmd>:vertical resize+5<CR>", { desc = "resize up" })


-- joshuto
vim.keymap.set({'n'},'<leader>jo','<cmd>:Joshuto',{ silent = true, noremap = true } )


-- Set <sapce> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[Setting options]]
vim.opt.number = true
-- vim.opt.relativenumber = true

-- enable mouse mode
vim.opt.mouse = 'a'

-- show the mode line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent 
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = false

-- 'example' --> 'Example','example' 
-- 'Example' --> 'Example' only
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn 
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

--  %s  [[substitute]]
-- foo/bar
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]

-- S for save
vim.keymap.set({ 'n', 'v' }, 'S', '<cmd>w<cr>', { silent = true, noremap = true })
-- Q for quit
vim.keymap.set({ 'n', 'v' }, 'Q', '<cmd>q<cr>', { silent = true, noremap = true })
-- Exit insert mode
vim.keymap.set({ 'i' }, 'jk', '<Esc>', { silent = true, noremap = true })

-- forbidden s
vim.keymap.set({ 'n' }, 's', '<Nop>', { silent = true, noremap = true })

-- Highlight on sarch
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move 
vim.keymap.set({ 'n', 'v' }, 'L', '$', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, 'K', '8k', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, 'J', '8j', { silent = true, noremap = true })

-- Diagnostic 
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message'})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

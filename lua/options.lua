vim.cmd 'let g:netrw_liststyle = 3'
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

vim.opt.smartindent = true

-- Save undo history
vim.opt.undofile = false

-- 'example' --> 'Example','example'
-- 'Example' --> 'Example' only
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

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

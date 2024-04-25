-- [[ Basic Keymaps ]]

-- S for save
vim.keymap.set({ 'n', 'v' }, 'S', '<cmd>w<cr>', { silent = true, noremap = true })
-- Q for quit
-- vim.keymap.set({ 'n', 'v' }, 'Q', '<cmd>q<cr>', { silent = true, noremap = true })

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
vim.keymap.set({ 'n', 'v' }, 'K', '5k', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, 'J', '5j', { silent = true, noremap = true })

-- Diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode (a new buffer)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('vino-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

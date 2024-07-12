require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- nop

map({ "n" }, "s", "<Nop>", { silent = true, noremap = true })

map({ "n", "v" }, "S", "<cmd>w<cr>", { desc = "Save file" })

-- Move
map({ "n", "v" }, "L", "$", { silent = true, noremap = true })
map({ "n", "v" }, "H", "^", { silent = true, noremap = true })
map({ "n", "v" }, "K", "5k", { silent = true, noremap = true })
map({ "n", "v" }, "J", "5j", { silent = true, noremap = true })

-- format Alt + Ctrl + l
map("n", "<A-C-l>", vim.lsp.buf.format, {})

-- tabufline
map("n", "=", function() require("nvchad.tabufline").next() end, { desc = "buffer goto next" })
map("n", "-", function() require("nvchad.tabufline").prev() end, { desc = "buffer goto prev" })
map("n", "<leader>bd", function() require("nvchad.tabufline").close_buffer() end, { desc = "buffer close" })

-- telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>;", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

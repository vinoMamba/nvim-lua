--[[Basic Keymaps]]
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "S", "<cmd>w<cr>", { desc = "Save file", silent = true, noremap = true })

-- Move
map({ "n", "v" }, "L", "$", { silent = true, noremap = true })
map({ "n", "v" }, "H", "^", { silent = true, noremap = true })
map({ "n", "v" }, "K", "5k", { silent = true, noremap = true })
map({ "n", "v" }, "J", "5j", { silent = true, noremap = true })

--Move lines
map("n", "<leader>j", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<leader>k", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("v", "<leader>j", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<leader>k", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

--Insert move
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

--Window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

--Buffer
map("n", "-", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "=", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "close current buffer" })
map("n", "<leader>ba", function ()
  require("nvchad.tabufline").closeAllBufs()
end , { desc = "close all buffers" })



--Indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- format
map("n", "<leader>l", vim.lsp.buf.format, {})

-- Exit terminal mode (a new buffer)
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

map({ "n", "t" }, "<A-1>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })


-- Telescope
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Search help_tags" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search buffers" })
map("n", "<leader>sc", "<cmd>Telescope commands<CR>", { desc = "Search commands" })
map("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "Search resume" })
map("n", "<leader>sd", "<cmd>Telescope diagostics<CR>", { desc = "Search diagostics" })
map('n', '<leader>st', "<cmd>TodoTelescope<cr>", { desc = 'Sdarch todo comments' })

map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "Search files in current dir" })
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Search live_grep" })
map("n", "<leader>;", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzily search in current buffer" })

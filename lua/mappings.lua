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

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })


-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.5, id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = {
      relative = "editor",
      row = 0.1,
      col = 0.2,
      width = 0.6,
      height = 0.6,
      border = "single",
    }
  }
end, { desc = "terminal toggle floating term" })

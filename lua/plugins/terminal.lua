return {
  "voldikss/vim-floaterm",
  event = "VeryLazy",
  config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.keymap.set({"n"}, "<leader>n", "<cmd>FloatermNew<CR>")
      vim.keymap.set({"n"}, "<leader>-", "<cmd>FloatermPrev<CR>")
      vim.keymap.set({"n"}, "<leader>=", "<cmd>FloatermNext<CR>")
      vim.keymap.set({"n"}, "<leader>t", "<cmd>FloatermToggle<CR>")
      vim.keymap.set({"n"}, "<leader>k", "<cmd>FloatermKill<CR>")


      vim.keymap.set({"t"}, "<leader>n", "<C-\\><C-n><cmd>FloatermNew<CR>")
      vim.keymap.set({"t"}, "<leader>-", "<C-\\><C-n><cmd>FloatermPrev<CR>")
      vim.keymap.set({"t"}, "<leader>=", "<C-\\><C-n><cmd>FloatermNext<CR>")
      vim.keymap.set({"t"}, "<leader>t", "<C-\\><C-n><cmd>FloatermToggle<CR>")
      vim.keymap.set({"t"}, "<leader>k", "<C-\\><C-n><cmd>FloatermKill<CR>")

      if vim.fn.executable("lazygit") then
        vim.keymap.set({ 'n' }, '<C-g>', '<cmd>FloatermNew lazygit<cr>', { silent = true, noremap = true })
      end
  end
}

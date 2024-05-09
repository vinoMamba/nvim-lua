local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.schedule(function()
      local keymaps = vim.api.nvim_buf_get_keymap(args.buf, 'n')
      local k_mapped = false
      local gd_mapped = false

      for _, keymap in pairs(keymaps) do
        if keymap.lhs == 'K' then
          k_mapped = true
        end
        if keymap.lhs == 'gd' then
          gd_mapped = true
        end
      end

      if k_mapped then
        vim.keymap.del("n", "K", { buffer = args.buf })
      end

      if gd_mapped then
        vim.keymap.del("n", "gd", { buffer = args.buf })
      end

      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "hover information" })
      vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
    end)
  end,
})

local lspconfig = require "lspconfig"


local servers = { "html", "cssls", "tsserver", "eslint", "tailwindcss", "gopls" }


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        require('none-ls.formatting.eslint_d'),
        require('none-ls.diagnostics.eslint_d'),
      }
    })
    vim.keymap.set('n', '<leader>l', vim.lsp.buf.format, {})
  end
}

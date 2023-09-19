return {
  "nvimdev/guard.nvim",
  -- Builtin configuration, optional
  dependencies = {
    "nvimdev/guard-collection",
  },
  config = function()
    local ft = require('guard.filetype')

    ft('lua'):fmt('lsp'):append('stylua')
    ft('html'):fmt('lsp')
    ft('typescriptreact'):fmt('lsp')

    -- Call setup() LAST!
    require('guard').setup({
      -- the only options for the setup function
      fmt_on_save = false,
      -- Use lsp if no formatter was defined for this filetype
      lsp_as_default_formatter = false,
    })

    vim.keymap.set({ 'n', }, '<leader>l', '<cmd>GuardFmt<cr>', { silent = true, noremap = true })
  end
}

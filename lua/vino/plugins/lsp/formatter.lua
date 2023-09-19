local Guard = {
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
    ft('typescript'):fmt('lsp')
    ft('jsonc'):fmt('lsp')
    ft('css-lsp'):fmt('lsp')

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

local Conform = {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettierd" },
        css = { "prettierd" },
        typescript = { "prettierd" }
      },
    })

    vim.keymap.set({ 'n', }, '<leader>l', '', {
      silent = true,
      noremap = true,
      callback = function(buffer_id)
        local conform = require("conform")
        conform.format({
          bufnr = buffer_id,
          async = true,
          lsp_fallback = true
        })
      end
    })
  end
}

return Conform

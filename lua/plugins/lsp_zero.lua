local M = {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
  },
  config = function()
    require('mason').setup({
      ui = {
        border = 'rounded'
      }
    })

    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({ buffer = bufnr })
    end)

    lsp.ensure_installed({
      -- Replace these with whatever servers you want to install
      'tsserver',
      'eslint',
    })

    require('lspconfig').eslint.setup({
      single_file_support = false,
      on_attach = function(client, bufnr)
        print('hello eslint')
      end
    })

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls({
      single_file_support = false,
      on_attach = function(client, bufnr)
        print('hello lua')
      end,
    }))

    lsp.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['lua_ls'] = { 'lua' },
      }
    })

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    lsp.setup()
  end
}
return {}

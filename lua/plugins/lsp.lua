return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {

      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      -- {'hrsh7th/nvim-cmp'},     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      -- {'L3MON4D3/LuaSnip'},     -- Required
      -- others
      {
        'j-hui/fidget.nvim',
        tag = "legacy"

      },
      "ray-x/lsp_signature.nvim",
      {
        "folke/trouble.nvim",
        opts = {
          use_diagnostic_signs = true,
          action_keys = {
            close = "<esc>",
          },
        },
      },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })

        client.server_capabilities.semanticTokensProvider = nil

        vim.diagnostic.config({
          severity_sort = true,
          underline = true,
          signs = true,
          virtual_text = false,
          update_in_insert = false,
          float = true,
        })
      end)

      lsp.set_sign_icons({
        error = ' ',
        warn = ' ',
        hint = ' ',
        info = ' '
      })

      lsp.ensure_installed({
        'lua_ls'
      })

      lsp.set_server_config({
        on_init = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end,

      })

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['gopls'] = { 'go' },
          -- if you have a working setup with null-ls
          -- you can specify filetypes it can format.
          -- ['null-ls'] = {'javascript', 'typescript'},
        }
      })

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
      })

      lsp.setup()
      require("fidget").setup()

      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {

          silent = true,
          focusable = false,
          border = "rounded",
        }
      )
      local group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        pattern = "*",
        callback = function()
          vim.diagnostic.open_float(0, {
            scope = "cursor",
            focusable = false,
            close_events = {
              "CursorMoved",
              "CursorMovedI",
              "BufHidden",
              "InsertCharPre",
              "WinLeave",
            },
          })
        end,
        group = group,
      })

      -- keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf, noremap = true, nowait = true }

          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)

          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)

          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)

          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)

          vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)
          vim.keymap.set('n', '<leader>-', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<leader>=', vim.diagnostic.goto_next, opts)
        end
      })
    end
  }
}

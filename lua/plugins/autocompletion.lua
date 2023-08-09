return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    {
      'saadparwaiz1/cmp_luasnip',
      dependencies = {
        'L3MON4D3/LuaSnip',
        dependencies = {
          "rafamadriz/friendly-snippets"
        }
      }
    }
  },
  config = function()
    local fgdark = "#2E3440"

    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })

    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#808080", bg = "NONE", italic = true })
    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = fgdark, bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = fgdark, bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = fgdark, bg = "#B5585F" })

    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = fgdark, bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = fgdark, bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = fgdark, bg = "#9FBD73" })

    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = fgdark, bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = fgdark, bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = fgdark, bg = "#D4BB6C" })

    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = fgdark, bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = fgdark, bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = fgdark, bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = fgdark, bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = fgdark, bg = "#A377BF" })

    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = fgdark, bg = "#7E8294" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = fgdark, bg = "#7E8294" })

    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = fgdark, bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = fgdark, bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = fgdark, bg = "#D4A959" })

    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = fgdark, bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = fgdark, bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = fgdark, bg = "#6C8ED4" })

    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = fgdark, bg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = fgdark, bg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = fgdark, bg = "#58B5A8" })
    require("luasnip.loaders.from_vscode").lazy_load()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
      },
      sources = cmp.config.sources {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
      },
      mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
      },
      experimental = {
        ghost_text = true
      }
    }
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
  end
}

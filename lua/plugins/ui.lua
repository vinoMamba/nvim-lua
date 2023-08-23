return {
  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {

    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                hint = " ",
                info = " ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = {
            { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  },
  -- bufferline
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '-', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '=', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)

      map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<leader>bd', '<Cmd>BufferClose<CR>', opts)
      map('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
      -- Wipeout buffer
      --                 :BufferWipeout

      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Magic buffer-picking mode
      -- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
      -- Sort automatically by...

      -- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
      -- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
      -- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
      -- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,

      -- insert_at_start = true,
      -- …etc.
      --
      icons = {
        button = "",
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
        separator = { left = '', right = '' },
      }
    },

    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   config = {
  --     options = {
  --       show_buffer_close_icons = false,
  --       show_close_icon = false,
  --       enforce_regular_tabs = true,
  --       show_duplicate_prefix = false,
  --       always_show_bufferline = true,
  --       indicator = {
  --         icon = "▎", -- this should be omitted if indicator style is not 'icon'
  --         -- style = 'icon' | 'underline' | 'none',
  --         style = "underline",
  --       }
  --     },
  --   }
  -- },
  -- -- bufferline move
  -- {
  --   "echasnovski/mini.bufremove",
  --   keys = {
  --     { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
  --     { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
  --   },
  -- },
  -- indent blankline
  {
    "shellRaining/hlchunk.nvim",
    init = function()
      require('hlchunk').setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = "#87afaf" },
          },
        },
        indent = {
          enable = false,
          chars = { "│", "¦", "┆", "┊", },
          use_treesitter = false,
          style = {
            "#FF0000",
            "#FF7F00",
            "#FFFF00",
            "#00FF00",
            "#00FFFF",
            "#0000FF",
            "#8B00FF",
          },
        },
        blank = {
          enable = false,
        },
        line_num = {
          use_treesitter = true,
          style = {
            { fg = "#87afaf" },
          },
        },
      })
    end
  },
  -- dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config

      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}

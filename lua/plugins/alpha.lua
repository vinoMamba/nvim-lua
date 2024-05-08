return {
  "goolord/alpha-nvim",
  event = "VimEnter", -- load plugin after all configuration is set
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    _Gopts = {
      position = "center",
      hl = "Type",
      -- wrap = "overflow";
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
      dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
      dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
    }

    local function footer()
      return "Neovim config by @vino"
    end
    dashboard.section.footer.val = footer()
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
    require("alpha").setup(dashboard.opts)
  end,
}

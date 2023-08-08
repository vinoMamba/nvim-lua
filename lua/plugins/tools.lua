return {
  -- flash 
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = function()
      return {
        { "S", false },
        {
          "\\",
          mode = { "n", "x", "o" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
      }
    end
  },
  --root dir
  {
		"airblade/vim-rooter",
		init = function()
			vim.g.rooter_patterns = { '__vim_project_root', '.git/' }
			vim.g.rooter_silent_chdir = true
			-- set an autocmd

			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					-- source .nvim.lua at project root

					vim.cmd([[silent! source .vim.lua]])
				end,
			})
		end
	},
  -- colorizer
  {
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,       -- #RGB hex codes
				RRGGBB = true,    -- #RRGGBB hex codes
				names = true,     -- "Name" codes like Blue or blue
				RRGGBBAA = false, -- #RRGGBBAA hex codes
				AARRGGBB = true,  -- 0xAARRGGBB hex codes
				rgb_fn = false,   -- CSS rgb() and rgba() functions
				hsl_fn = false,   -- CSS hsl() and hsla() functions
				css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "virtualtext", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = true,
				sass = { enable = false },
				virtualtext = "■",
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},

		}
	},
  -- Todo Comments
  -- TODO todo
  -- HACK hack
  -- WARN warn
  -- PERF perf
  -- NOTE note
  -- TEST test
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys= {
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
  -- highlighting on focus
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
				providers = {
					-- 'lsp',
					-- 'treesitter',
					'regex',
				},
        delay = 200,
			})
    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
    end
  },
  -- autopairs
  {     
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  --comment
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {}
  },
  -- joshuto
  {
	  "theniceboy/joshuto.nvim",
	  very_lazy = true,
	  cmd = "Joshuto",
	  config = function()
		  vim.g.joshuto_floating_window_scaling_factor = 1.0
		  vim.g.joshuto_use_neovim_remote = 1
		  vim.g.joshuto_floating_window_winblend = 0
	  end
  },
  -- havefun 
  {
    "Eandrju/cellular-automaton.nvim",
	  keys = "<leader>rr",
	  config = function()
		  vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>")
	  end,
  }
}

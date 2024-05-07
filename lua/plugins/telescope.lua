return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',
        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons',enabled = true },
    },
    config = function()

      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require("telescope.themes").get_dropdown()
          }
        }
      }

      require("telescope").load_extension("ui-select")
      require('telescope').load_extension('fzf')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh',       builtin.help_tags, { desc = 'Search help tags' })
      vim.keymap.set('n', '<leader>sk',       builtin.keymaps, { desc = 'Search keymaps' })
      vim.keymap.set('n', '<leader>sb',       builtin.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<leader>sc',       builtin.commands, { desc = 'Search commands' })
      vim.keymap.set('n', '<leader>sr',       builtin.resume, { desc = 'Search resume' })
      vim.keymap.set('n', '<leader>sd',       builtin.diagnostics, { desc = 'Sdarch diagnostics' })

      vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Search files in current dir' })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "telescope live grep" })
      vim.keymap.set("n", "<leader>;", builtin.current_buffer_fuzzy_find, { desc = "telescope find in current buffer" })


      -- Slightly advanced example of overriding default behavior and theme
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end
  }
}

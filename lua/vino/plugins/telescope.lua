return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local m = { noremap = true, nowait = true }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, m)          -- 查找文件
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, m)                 -- 查找关键词
    vim.keymap.set('n', '<leader>fb', builtin.buffers, m)                   -- 当前打开的buffer
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, m)                 -- help
    vim.keymap.set('n', '<leader>fl', builtin.resume, m)                    -- 上次查找的关键词
    vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, m) -- 当前 buffer 内查找
    -- vim.keymap.set('n', ':', builtin.commands, m)
    require('telescope').setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--fixed-strings",
          "--smart-case",
          "--trim",
        },
        color_devicons = true,
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        file_ignore_patterns = { "node_modules", "dist" },
      },
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
  end
}

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "right",
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "??",
              staged = "A",
              unmerged = "",
              renamed = "R",
              untracked = "U",
              deleted = "D",
              ignored = "◌",
            }
          }
        }
      }
    })
    
    -- vim.keymap.set('n','<leader>ee','<cmd>NvimTreeToggle<CR>',{ desc = 'Toggle file explore'})
    vim.keymap.set('n','<leader>ee','<cmd>NvimTreeFindFileToggle<CR>',{ desc = 'Toggle file explore'})

  end
}

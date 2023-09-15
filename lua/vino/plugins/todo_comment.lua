  -- TODO: todo
  -- HACK: hack
  -- WARN: warn
  -- PERF: perf
  -- NOTE: note
  -- TEST: test
return  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  }

local M = {}

M.keyBinding = function()
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

return M

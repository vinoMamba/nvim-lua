local null_ls = require "null-ls"

local options = {
  source = {
    null_ls.builtins.formatting.stylua,
    require "none-ls.formatting.eslint_d",
    require "none-ls.diagnostics.eslint_d",
  },
}

return options

local opts = require "nvchad.configs.treesitter"
opts.ensure_installed = {
  "regex",
  "lua",
  "luadoc",
  "tsx",
  "typescript",
  "go",
  "css",
  "scss",
  "html",
  "json",
  "markdown"
}
return opts

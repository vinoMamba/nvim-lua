return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'html',
      'lua',
      'luadoc',
      'vim',
      'regex',
      'markdown',
      'sql',
      'tsx',
      'typescript',
      'go',
    },
    auto_install = true,
    highlight = {
      enable = false,
      additional_vim_regex_highlighting = false
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require 'nvim-treesitter.configs'.setup(opts)
  end
}

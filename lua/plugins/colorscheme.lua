return {
  {
    'sainnhe/sonokai',
    config = function()
      if vim.o.termguicolors then
        vim.o.termguicolors = true
      end
      vim.g.sonokai_style = 'andromeda'
      vim.g.sonokai_better_performance = 1
      vim.cmd('colorscheme sonokai')
    end
  }
}

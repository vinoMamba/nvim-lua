return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        indicator = {
          style = 'underline',
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level )
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        show_close_icon = false,
        show_buffer_close_icons = false,
        tab_size = 16,
        padding = 0,
        separator_style = "thick",
      }
    }
  }
}

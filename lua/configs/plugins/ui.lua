return {
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      require('lualine').setup({
        options = {
          theme = "catppuccin"
        }
      })
    end,
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      require('lualine').setup({
        options = {
          theme = "catppuccin"
        },
        sections = {
          lualine_x = {
            { "' ' .. vim.g.xcodebuild_last_status", color = { fg = "Gray" } },
            { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#a6e3a1", bg = "#161622" } },
            { xcodebuild_device, color = { fg = "#f9e2af", bg = "#161622" } },
          },
        }
      })
    end,
  },
}

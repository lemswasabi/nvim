return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "vim",
        "vimdoc",
      },
      auto_install = false,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "catppuccin/nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["jk"] = require("telescope.actions").close,
            },
          },
        },
      })
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
      vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, {})

      vim.keymap.set("n", "<leader>fc", function()
        builtin.colorscheme({ enable_preview = true })
      end, {})
    end,
  },
}

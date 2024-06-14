return {
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "VeryLazy",
    event = "BufEnter",
    -- lazy = true,
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufEnter",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  {
    "echasnovski/mini.comment",
    event = "BufEnter",
    config = function()
      require("mini.comment").setup()
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    event = "InsertEnter",
    config = function()
      require("mini.splitjoin").setup()
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
  },

  {
    "ojroques/nvim-osc52",
    config = function()
      local osc52 = require("osc52")
      osc52.setup({})

      vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, {expr = true})
      vim.keymap.set("n", "<leader>cc", "<leader>c_", {remap = true})
      vim.keymap.set("v", "<leader>c", require("osc52").copy_visual)
    end
  },
}

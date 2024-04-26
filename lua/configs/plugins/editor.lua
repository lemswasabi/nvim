return {
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
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
    event = "VeryLazy",
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
    event = "BufEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    event = "BufEnter",
    config = function()
      require("mini.splitjoin").setup()
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit"}
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
    keys = {
      { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Open/Close tree"},
      { "<leader>tf", "<cmd>NvimTreeFocus<cr>", desc = "Open and focus on tree"}
    }
  }



}

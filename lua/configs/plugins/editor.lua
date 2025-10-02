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

      vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
      vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
      vim.keymap.set("v", "<leader>c", require("osc52").copy_visual)
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      enable_check_bracket_line = true,
    },
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        enable_check_bracket_line = false,
      })
    end,
  },

  {
    "ggandor/leap.nvim",
    enabled = true,
    config = function()
      require("leap").set_default_mappings()
      -- vim.schedule(function()
      --   vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Conceal" })
      -- end)

      require("leap").opts.equivalence_classes = {
        " \t\r\n",
        "([{",
        ")]}",
        [['"`]],
      }

      -- remote actions
      vim.keymap.set({ "n", "x", "o" }, "gs", function()
        require("leap.remote").action()
      end)

      -- automatic paste after remote yanking
      vim.api.nvim_create_autocmd("User", {
        pattern = "RemoteOperationDone",
        group = vim.api.nvim_create_augroup("LeapRemote", {}),
        callback = function(event)
          -- Do not paste if some special register was in use.
          if vim.v.operator == "y" and event.data.register == '"' then
            vim.cmd("normal! p")
          end
        end,
      })
    end,
  },
}

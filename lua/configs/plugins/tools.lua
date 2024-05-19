return {
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
  },

  {
    "folke/zen-mode.nvim",
    enabled = false,
    opts = {}
  },

  -- pomodoro timer
  {
    "epwalsh/pomo.nvim",
    version = "*",  -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {}
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    cmd = { "ObsidianWorkspace" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "epwalsh/pomo.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "symbiotics_docs",
          path = "~/vaults/work/symbiotics/docs",
          strict = true,
        },
        {
          name = "team_meeting_notes",
          path = "~/vaults/work/symbiotics/notes/team_meeting_notes",
          strict = true,
        }
      },

      templates = {
        folder = "templates",
        date_format = "%d-%m-%Y",
        time_format = "%H:%M",
      },

      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },
    },
  },

  {
    "wintermute-cell/gitignore.nvim",
    -- event = "VeryLazy",
    cmd = { "Gitignore" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }
  },

}

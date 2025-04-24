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

  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*",  -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   cmd = { "ObsidianWorkspace" },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "epwalsh/pomo.nvim",
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "symbiotics_docs",
  --         path = "~/vaults/work/symbiotics/docs",
  --         strict = true,
  --       },
  --       {
  --         name = "team_meeting_notes",
  --         path = "~/vaults/work/symbiotics/notes/team_meeting_notes",
  --         strict = true,
  --       }
  --     },
  --
  --     templates = {
  --       folder = "templates",
  --       date_format = "%d-%m-%Y",
  --       time_format = "%H:%M",
  --     },
  --
  --     -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  --     completion = {
  --       -- Set to false to disable completion.
  --       nvim_cmp = true,
  --       -- Trigger completion at 2 chars.
  --       min_chars = 2,
  --     },
  --   },
  -- },

  {
    "wintermute-cell/gitignore.nvim",
    -- event = "VeryLazy",
    cmd = { "Gitignore" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "BufEnter",
    config = function()
      require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      terminal_mappings = false,
      })
    end
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      -- provider = "openai",
      -- openai = {
      --   endpoint = "https://api.openai.com/v1",
      --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      --   temperature = 0,
      --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      -- },
      provider = "ollama",
      ollama = {
        endpoint = "http://sair:11434", -- Note that there is no /v1 at the end.
        model = "qwq:latest",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

}

return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
    keys = {
      { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Open/Close tree" },
      { "<leader>tf", "<cmd>NvimTreeFocus<cr>", desc = "Open and focus on tree" },
    },
  },

  {
    "folke/zen-mode.nvim",
    enabled = false,
    opts = {},
  },

  -- pomodoro timer
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {},
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
    },
  },

  {
    "akinsho/toggleterm.nvim",
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
    end,
  },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     providers = {
  --       openai = {
  --         endpoint = "https://api.openai.com/v1",
  --         model = "gpt-4.1", -- your desired model (or use gpt-4o, etc.)
  --         timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --         extra_request_body = {
  --           temperature = 0,
  --           max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --           --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --         },
  --       },
  --     }
  --     -- provider = "ollama",
  --     -- ollama = {
  --     --   endpoint = "http://sair:11434", -- Note that there is no /v1 at the end.
  --     --   model = "qwq:latest",
  --     -- },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  {
    "wojciech-kulik/xcodebuild.nvim",
    ft = "swift",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-tree.lua",
      "stevearc/oil.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim", -- needed for the integration
    },
    integrations = {
      pymobiledevice = {
        enabled = true,
      },
    },
    config = function()
      local progress_handle

      require("xcodebuild").setup({
        show_build_progress_bar = false, -- hide default bar

        logs = {
          notify = function(message, severity)
            local fidget = require("fidget")

            if progress_handle then
              progress_handle.message = message

              if not message:find("Loading") then
                progress_handle:finish()
                progress_handle = nil
              end

              if vim.trim(message) ~= "" then
                fidget.notify(message, severity)
              end
            else
              fidget.notify(message, severity)
            end
          end,

          notify_progress = function(message)
            local progress = require("fidget.progress")

            if progress_handle then
              progress_handle.title = ""
              progress_handle.message = message
            else
              progress_handle = progress.handle.create({
                message = message,
                lsp_client = { name = "xcodebuild.nvim" },
              })
            end
          end,
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          swift = { "swiftformat" },
          html = { "prettierd" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          nix = { "alejandra" },
          python = { "isort", "ruff_format" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        -- format_on_save = function(bufnr)
        --   -- Disable autoformat if requested
        --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        --     return
        --   end
        --   local ignore_filetypes = { "oil" }
        --   if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        --     return
        --   end
        --   return { timeout_ms = 500, lsp_fallback = true }
        -- end,
        -- log_level = vim.log.levels.ERROR,
      })

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        swift = { "swiftlint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
        group = lint_augroup,
        callback = function()
          if not vim.endswith(vim.fn.bufname(), "swiftinterface") then
            lint.try_lint()
          end
        end,
      })

      vim.keymap.set("n", "<leader>ml", function()
        lint.try_lint()
      end, { desc = "Lint current file" })
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      local fidget = require("fidget")
      fidget.setup({
        notification = {
          window = {
            normal_hl = "String", -- Base highlight group in the notification window
            winblend = 0, -- Background color opacity in the notification window
            border = "rounded", -- Border around the notification window
            zindex = 45, -- Stacking priority of the notification window
            max_width = 0, -- Maximum width of the notification window
            max_height = 0, -- Maximum height of the notification window
            x_padding = 1, -- Padding from right edge of window boundary
            y_padding = 1, -- Padding from bottom edge of window boundary
            align = "bottom", -- How to align the notification window
            relative = "editor", -- What the notification window position is relative to
          },
        },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<localleader>tt", "<cmd>Trouble quickfix toggle<cr>", { desc = "Open a quickfix" } },
    },

    opts = {},
    config = function()
      require("trouble").setup({
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_jump = false,
        mode = "quickfix",
        severity = vim.diagnostic.severity.ERROR,
        cycle_results = false,
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    ft = { "python", "rust", "swift" },
    dependencies = {
      "wojciech-kulik/xcodebuild.nvim",
    },
    config = function()
      local xcodebuild = require("xcodebuild.integrations.dap")
      -- SAMPLE PATH, change it to your local codelldb path
      local codelldbPath = os.getenv("HOME") .. "/bin/codelldb-darwin-arm64/extension/adapter/codelldb"

      xcodebuild.setup(codelldbPath)

      vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
      vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
      vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
      vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
      vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
      vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    ft = { "python", "rust", "swift" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 }, -- 🔥 required by xcodebuild.nvim
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- Auto open/close dap-ui using official pattern
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map("n", "<leader>ghb", function()
            gitsigns.blame_line({ full = true })
          end, { desc = "Gitsigns: Blame line" })
        end,
      })
    end,
  },

  {
    "jbyuki/instant.nvim",
    enabled = true,
    cmd = {
      "InstantStartSingle",
      "InstantJoinSingle",
      "InstantStartSession",
      "InstantJoinSession",
    },
    config = function()
      vim.g.instant_username = "lemswasabi"
    end,
  },
}

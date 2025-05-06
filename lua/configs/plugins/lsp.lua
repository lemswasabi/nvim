return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    "neovim/nvim-lspconfig",
    cmd = {"Lspinfo", "Lspinstall", "Lspstart", "Mason"},
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "L3MON4D3/LuaSnip",
    },
    config = function()

      require("mason").setup()

      -- This is where all the LSP shenanigans will live
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,

          rust_analyzer = function()
            require("lspconfig").rust_analyzer.setup({
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    allFeatures = true,
                  },
                  -- TODO: fix this
                  checkOnSave = {
                    command = "clippy",
                  },
                  formatting = {
                    enable = true,
                  },
                },
              },
              on_attach = function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })

                -- Autoformat on save
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format({ async = false })
                  end,
                })
              end
            })
          end,

        }
      })

      -- TODO: speed up load time
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      local defaultLSPs = {
        "sourcekit",
      }

      for _, lsp in ipairs(defaultLSPs) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = lsp == "sourcekit" and { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) } or nil,
        })
       end

      end
  }
}

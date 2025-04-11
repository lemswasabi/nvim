return {
  "hrsh7th/nvim-cmp",
  -- event = "BufEnter",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "neovim/nvim-lspconfig",
    -- LuaSnip for snippet support
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",  -- nvim-cmp source for LuaSnip
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Define the println! snippet
    -- TODO: make this better
    luasnip.add_snippets("rust", {
      luasnip.snippet("println", {
        luasnip.text_node("println!(\""),
        luasnip.insert_node(1, ""),
        luasnip.text_node("\");"),
        -- luasnip.insert_node(2),  -- Move cursor after the closing parenthesis
      }),
    })

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },  -- Include LuaSnip as a source
      }, {
        { name = "buffer" },
        { name = "path" },
        { name = "emoji", option = { insert = true } },
      }),
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = 'buffer' } }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
  end
}

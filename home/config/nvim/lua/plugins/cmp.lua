-- local selectors = function()
--   local cmp = require("cmp")
--   local has_words_before = function()
--     unpack = unpack or table.unpack
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--   end
--
--   return {
--     select_next = function(fallback)
--       if cmp.visible() then
--         -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
--         cmp.select_next_item()
--       -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--       -- this way you will only jump inside the snippet region
--       elseif has_words_before() then
--         cmp.complete()
--       else
--         fallback()
--       end
--     end,
--     select_prev = function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       else
--         fallback()
--       end
--     end,
--   }
-- end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- LSP completion source:
      "hrsh7th/cmp-nvim-lsp",
      -- Useful completion sources:
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
    },
    ------@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      -- local ops = selectors()

      opts.snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      }

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "path" }, -- file paths
        { name = "nvim_lsp", keyword_length = 3 }, -- from language server
        { name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
        { name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = "buffer", keyword_length = 2 }, -- source current buffer
        { name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
        { name = "calc" }, -- source for math calculation
        { name = "emoji", keyword_length = 2 }, -- source for emoji
      }))

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "λ",
            vsnip = "⋗",
            buffer = "Ω",
            path = "🖫",
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      }

      -- opts.completion =
      --   vim.tbl_extend("force", opts.completion or {}, { completeopt = "menu,menuone,noselect,noinsert" })

      opts.mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      }

      require("cmp").setup(opts)
    end,
  },
}

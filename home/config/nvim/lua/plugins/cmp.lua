local selectors = function()
  local cmp = require("cmp")
  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    select_next = function(fallback)
      if cmp.visible() then
        -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- this way you will only jump inside the snippet region
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,
    select_prev = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {

      "hrsh7th/nvim-cmp",

      -- LSP completion source:
      "hrsh7th/cmp-nvim-lsp",

      -- Useful completion sources:
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",

      "hrsh7th/cmp-emoji",
      -- "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-cmdline",
      -- "saadparwaiz1/cmp_luasnip",
      -- "L3MON4D3/LuaSnip",
    },
    ------@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local ops = selectors()

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "emoji" },
      }))

      opts.completion =
        vim.tbl_extend("force", opts.completion or {}, { completeopt = "menu,menuone,noselect,noinsert" })

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(ops.select_next, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(ops.select_prev, { "i", "s" }),
      })

      require("cmp").setup(opts)
    end,
  },
}

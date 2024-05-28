return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "creativenull/efmls-configs-nvim",
      },
    },
    opts = function(_, opts)
      -- local format_eslint_d = require("efmls-configs.formatters.eslint_d")
      -- local lint_eslint_d = require("efmls-configs.linters.eslint_d")
      local prettier_d = require("efmls-configs.formatters.prettier_d")

      local languages = {
        html = {
          -- format_eslint_d
          prettier_d,
        },

        javascript = {
          prettier_d,
          -- format_eslint_d,
          -- lint_eslint_d,
        },
        javascriptreact = {
          prettier_d,
          -- format_eslint_d,
          -- lint_eslint_d,
        },
        typescript = {
          prettier_d,
          -- format_eslint_d,
          -- lint_eslint_d,
        },
        typescriptreact = {
          prettier_d,
          -- format_eslint_d,
          -- lint_eslint_d,
        },
      }

      opts.servers.efm = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { ".git/" },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }
    end,
  },
}

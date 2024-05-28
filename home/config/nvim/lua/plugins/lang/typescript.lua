return {
  -- add typescript to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "pmizio/typescript-tools.nvim",
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        ---type lspconfig.options.tsserver
        tsserver = {
          on_attach = function(client, bufnr)
            vim.keymap.set({ "n", "v" }, "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", { buffer = bufnr })
            vim.keymap.set({ "n", "v" }, "<leader>cs", "<cmd>TSToolsGoToSourceDefinition<CR>", { buffer = bufnr })
            vim.keymap.set({ "n", "v" }, "<leader>ci", "<cmd>TSToolsAddMissingImports<CR>", { buffer = bufnr })
          end,
          settings = {
            separate_diagnostic_server = true,
            -- "change"|"insert_leave" determine when the client asks the server about diagnostic
            publish_diagnostic_on = "insert_leave",
            -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
            -- "remove_unused_imports"|"organize_imports") -- or string "all"
            -- to include all supported code actions
            -- specify commands exposed as code_actions
            expose_as_code_action = "all",
            -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
            -- not exists then standard path resolution strategy is applied
            tsserver_path = nil,
            -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
            -- (see 💅 `styled-components` support section)
            tsserver_plugins = {},
            -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
            -- memory limit in megabytes or "auto"(basically no limit)
            tsserver_max_memory = "auto",
            -- described below
            tsserver_format_options = {
              indentSize = 2,
              tabSize = 2,
              -- convertTabsToSpaces = true,
              -- indentStyle = "Smart",
              -- trimTrailingWhitespace = true,
              -- insertSpaceAfterCommaDelimiter = true,
              -- insertSpaceAfterSemicolonInForStatements = true,
              -- insertSpaceAfterKeywordsInControlFlowStatements = true,
              -- semicolons = "insert",
            },
            tsserver_file_preferences = {
              quotePreference = "single",
              displayPartsForJSDoc = true,
              generateReturnInDocTemplate = true,
            },
            -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
            complete_function_calls = false,
          },
          init_options = {
            documentFormatting = false,
            documentRangeFormatting = false,
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript-tools").setup(opts)
          return true
        end,
      },
    },
  },
}

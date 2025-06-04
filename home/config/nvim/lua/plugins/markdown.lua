return {
  -- Markdown Preview Plugin
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- Treesitter Configuration for Markdown Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = { "markdown", "markdown_inline", "rust", "bash", "c", "cpp", "json", "lua" } -- Ensure Markdown parsers
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown", "html" }, -- Include html
      }
    end,
  },
}

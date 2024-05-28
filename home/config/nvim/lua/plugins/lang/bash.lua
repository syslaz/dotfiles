return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" },
        root_dir = require("lspconfig").util.root_pattern(".git"),
      },
    },
  },
}

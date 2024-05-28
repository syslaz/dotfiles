-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_command("autocmd BufRead,BufNewFile *.wsb set filetype=xml")

vim.g.minipairs_disable = true -- disable auto quotes etc

if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    -- paste = {
    -- ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    -- ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    -- },
  }
end

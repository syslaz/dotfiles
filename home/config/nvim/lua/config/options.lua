-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_command("autocmd BufRead,BufNewFile *.wsb set filetype=xml")

vim.g.minipairs_disable = true -- disable auto quotes etc

function no_paste(reg)
  return function(lines) end
end

if os.getenv("SSH_TTY") then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = no_paste("+"), -- pasting disabled
      ["*"] = no_paste("*"), -- pasting disabled
    },
  }
end

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_command("autocmd BufRead,BufNewFile *.wsb set filetype=xml")

-- vim.g.autoformat = false

vim.g.minipairs_disable = true -- disable auto quotes etc
-- vim.opt.wrap = true
--
--#region
-- vim.opt.shellslash = false

-- vim.opt.shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell'
-- vim.opt.shellcmdflag =
-- "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
-- vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
-- vim.opt.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""
-- vim.opt.shellslash = false

-- vim.lsp.buf.timeout_ms = 5000

-- vim.opt.shell

-- vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
-- vim.opt.shellcmdflag =
-- "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellquote = "\""
-- vim.opt.shellxquote = ""

-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--   },
-- paste = {
--   ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--   ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
-- },
-- }

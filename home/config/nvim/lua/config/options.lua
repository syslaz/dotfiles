-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set pwsh as the default shell in Neovim
vim.opt.shell = "pwsh"

-- Shell command flags to make pwsh work correctly with Neovim
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
vim.opt.shellredir = "> %s 2>&1"

-- Optional: set encoding to avoid issues with special characters
vim.opt.shelltemp = false

vim.g.autoformat = true
vim.g.minipairs_disable = true
vim.g.colorscheme = "vscode"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.termsync = true
vim.g.lazyvim_picker = "telescope"
vim.o.wrap = false

-- vim.g.rustaceanvim = {
--   tools = {
--     inlay_hints = { auto = true },
--   },
--   dap = {
--     autoload_configurations = true,
--   },
--   default_settings = {
--     -- rust-analyzer language server configuration
--     ["rust-analyzer"] = {
--       cmd = { "rust-analyzer" },
--       settings = {
--         cargo = {
--           allFeatures = true,
--         },
--         procMacro = {
--           enable = true,
--         },
--       },
--     },
--   },
--   -- …any other globals you want
-- }

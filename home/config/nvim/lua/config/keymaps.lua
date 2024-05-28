-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local function map(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   ---@cast keys LazyKeysHandler
--   -- do not create the keymap if a lazy keys handler exists
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
-- end

-- vim.keymap.set("n", "q", "<Nop>")

-- This file is automatically loaded by lazyvim.config.init
-- local Util = require("lazyvim.util")
-- local lazyterm = function() Util.terminal("zsh", { }) end
-- vim.keymap.set("n", "<c-/>", lazyterm, { desc = "Terminal (cwd dir)" })
-- vim.keymap.set("t", "<esc>", "<cmd>close<cr>", { desc = "Close the terminal"})

-- Disable file has changed warning for working with network drives
-- vim.keymap.set("n", "<c-s>", ":w!<cr>", { silent = true, noremap = true })
-- vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true, noremap = true })
--

-- vim.keymap.set({ 'n', 'v' }, 'j', '<cmd>jzz<cr>', { silent = true, noremap = true })
-- vim.keymap.set({ 'n', 'v' }, 'k', '<cmd>kzz<cr>', { silent = true, noremap = true })


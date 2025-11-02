-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General ---------------------------------------------------------------------
--test
map("n", "<F2>", ":echo strftime('%c')<CR>", { desc = "Show current date and time" })
map("n", "Q", "q", { desc = "Record macro" })
map("n", "q", ":quit<CR>", { desc = "Quit current window" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>write<cr>", { desc = "Save file" })
map("n", "<C-p>", ":PlugClean | :PlugUpdate | :PlugUpgrade<CR>", { desc = "Manage plugins" })
map("n", "<CR>", ":noh<CR><CR>", { desc = "Clear search highlight" })

-- Buffers ---------------------------------------------------------------------

map("n", "gn", ":bn<cr>", { desc = "Next buffer" })
map("n", "gp", ":bp<cr>", { desc = "Previous buffer" })
map("n", "gd", ":bd<cr>", { desc = "Delete buffer" })

-- Theme -----------------------------------------------------------------------

map("n", "ga", ":AirlineTheme ", { desc = "Change Airline theme" })

-- Tracing spaces --------------------------------------------------------------

map("n", "gt", ":%s/\\s\\+$//g<cr> <C-o> zz", { desc = "Trim trailing spaces" })

-- Centering movement ----------------------------------------------------------

map("n", "j", "jzz", { desc = "Move down and center" })
map("n", "k", "kzz", { desc = "Move up and center" })
map("n", "gg", "ggzz", { desc = "Go to top and center" })
map("n", "G", "Gzz", { desc = "Go to bottom and center" })
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Prev search result centered" })

-- Undo-friendly insert edits --------------------------------------------------

local undo_keys = { ",", ".", "!", "?", "(", "[", " " }
for _, key in ipairs(undo_keys) do
  map("i", key, key .. "<c-g>u", { desc = "Insert '" .. key .. "' and break undo sequence" })
end

-- Move lines ------------------------------------------------------------------

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("i", "<C-j>", "<esc>:m .+1<CR>==", { desc = "Move line down (insert)" })
map("i", "<C-k>", "<esc>:m .-2<CR>==", { desc = "Move line up (insert)" })
map("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })


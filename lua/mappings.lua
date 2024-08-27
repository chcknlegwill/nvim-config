require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- mapping to run c files (F8)
-- map("n", "<F8>", ": !gcc % && ./a.out <CR>")
map ("n", "<F8>", ":w <CR> :!gcc % -o %< && %< <CR>")
-- works (blessed AF!!!!)

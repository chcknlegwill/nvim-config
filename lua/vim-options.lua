vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set nowrap") --no wrapping
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.mapleader = " "

vim.keymap.set("n", ":", ":", { desc = "Open default command-line" })

-- buffer management-- buffer management-- buffer management
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

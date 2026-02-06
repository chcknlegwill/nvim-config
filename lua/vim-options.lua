vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set nowrap") --no wrapping

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>vd", vim.cmd.Ex) --changed "pv" to "vd" -> view directory
vim.keymap.set("n", "<leader>le", vim.cmd.Lexplore) --opens Netrw on the left side

vim.keymap.set("n", ":", ":", { desc = "Open default command-line" })

-- buffer - 
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bc", ":bd", { desc = "Closes buffer" })

-- resizing windows --
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<A-Left", ":vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right", ":vertial resize +2<CR>")


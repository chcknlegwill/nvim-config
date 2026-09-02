


vim.g.mapleader = " "

-- Spelling
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false 

-- Scrolling
vim.opt.scrolloff = 8

-- Markdown-friendly line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins modularly from lua/plugins/
require("lazy").setup({
  import = "plugins",
})


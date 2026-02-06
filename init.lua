local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },

    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

--adding things to resized the Netrw window
local netrw_group = vim.api.nvim_create_augroup("NetrwCustom", { clear = true })

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "netrw",
  group = netrw_group,
  callback = function()
    --map alt+arrow keys just like vim-options, only with a buffer enabled for window resizing
    vim.keymap.set('n', '<A-Up>', ':resize +2<CR>', { remap = false, buffer = true })
    vim.keymap.set('n', '<A-Down>', ':resize -2<CR>', { remap = false, buffer = true })
    vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', { remap = false, buffer = true })
    vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { remap = false, buffer = true })
  end
})



require("vim-options")
require("lazy").setup("plugins")



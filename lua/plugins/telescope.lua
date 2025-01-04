return {'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }, 
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) --originaly control + p (<C-p>)

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

  end
} --make sure to add a comma when adding stuff  




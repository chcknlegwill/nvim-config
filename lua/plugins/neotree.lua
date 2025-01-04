return  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function() 
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
    --need <CR> (Character Return at the end otherwise it just puts the command
    --into the line and you have to press enter to execute it.


  end 
}


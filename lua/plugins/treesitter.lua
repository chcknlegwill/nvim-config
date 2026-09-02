return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local parsers = { "bash", "go", "c", "html", "css", "javascript", "lua", "vim", "vimdoc" }
    pcall(function()
      require("nvim-treesitter").install(parsers)
    end)
  end,
}

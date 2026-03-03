return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "gopls" },
			automatic_installation = true,
			handlers = {
				-- Default handler
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- Lua handler
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = { checkThirdParty = false },
							},
						},
					})
				end,

				-- OCaml handler (The Fix for the version mismatch)
				["ocamllsp"] = function()
					require("lspconfig").ocamllsp.setup({
						cmd = { "ocamllsp" },
					})
				end,
			},
		})
	end,
}

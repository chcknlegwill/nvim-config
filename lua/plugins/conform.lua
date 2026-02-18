-- lua/plugins/conform.lua
-- conform.nvim — modern, fast formatter. Replaces null-ls / none-ls for formatting.
--
-- How it works: you map filetypes to formatters. On save (or keymap), conform
-- runs the appropriate formatter for the current buffer's filetype.
--
-- Formatters must be installed separately (use mason-conform or install manually).
-- Common ones: prettierd, stylua, black, isort, gofmt, rustfmt, clang-format, shfmt

return {
	{
		"stevearc/conform.nvim",
		dependencies = {
			-- mason-conform bridges Mason and conform so Mason can auto-install formatters
			-- Remove this if you don't use Mason
			{
				"zapling/mason-conform.nvim",
				opts = {}, -- auto-installs formatters that are configured below
			},
		},
		event = { "BufWritePre" }, -- load before saving so format-on-save works
		cmd = { "ConformInfo" }, -- also load on :ConformInfo command
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = { "n", "v" },
				desc = "Format buffer / selection",
			},
		},
		opts = {
			-- ─── Formatter definitions per filetype ─────────────────────────────────
			-- List multiple formatters to chain them (they run left to right)
			-- "lsp" means fall back to LSP formatting if no formatter is found
			formatters_by_ft = {
				-- Web
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },

				-- Lua
				lua = { "stylua" },

				-- Python (isort sorts imports, black formats everything else)
				python = { "isort", "black" },

				-- Go
				go = { "gofmt", "goimports" },

				-- Rust (rustfmt ships with rustup, usually already available)
				rust = { "rustfmt", lsp_format = "fallback" },

				-- C / C++
				c = { "clang_format" },
				cpp = { "clang_format" },

				--ocaml
				ocml = { "ocamlformat" }, --use ocaml-lsp for most recent version (5.x - needed 4.14 for uni)

				-- Shell
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },

				-- Catch-all: use LSP formatter for anything not listed above
				["_"] = { "trim_whitespace" },
			},

			-- ─── Format on save ──────────────────────────────────────────────────────
			format_on_save = function(bufnr)
				-- Disable format-on-save for specific filetypes
				local disable_filetypes = { "sql", "java" }
				if vim.tbl_contains(disable_filetypes, vim.bo[bufnr].filetype) then
					return
				end

				-- Disable for files in specific paths (e.g. vendored code)
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") or bufname:match("/vendor/") then
					return
				end

				return {
					timeout_ms = 500,
					lsp_format = "fallback", -- use LSP if no conform formatter is configured
				}
			end,

			-- ─── Formatter options ───────────────────────────────────────────────────
			formatters = {
				-- Override shfmt to use 2-space indent
				shfmt = {
					prepend_args = { "-i", "2" },
				},
				-- Override stylua to read project-level stylua.toml if present
				stylua = {
					require_cwd = true, -- only run if stylua.toml exists in project root
					condition = function(ctx)
						return vim.fs.find({ "stylua.toml", ".stylua.toml" }, { path = ctx.filename, upward = true })[1]
					end,
				},
			},
		},

		-- ─── Show format status in lualine ─────────────────────────────────────────
		-- If you use lualine, add this to your lualine components:
		--   require("conform").formatters_by_ft[vim.bo.filetype]
		-- Or use the built-in statusline helper:
		--   require("conform").get_formatter_info()
	},
}

-- lua/plugins/smart-splits.lua (OPTIONAL)
-- Smart window navigation that works seamlessly with tmux
-- If you don't use tmux, you can skip this plugin and just use the window-keymaps.lua
-- But if you DO use tmux, this lets Ctrl+hjkl navigate BOTH vim splits AND tmux panes

return {
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		config = function()
			require("smart-splits").setup({
				-- Ignored buffer types (won't resize these)
				ignored_buftypes = { "nofile", "quickfix", "prompt" },
				ignored_filetypes = { "NvimTree", "neo-tree" },

				-- When moving between splits at edge, default behavior
				-- Set to false if you don't use tmux
				at_edge = "wrap", -- "wrap" | "split" | "stop"

				-- Amount to resize by default
				default_amount = 3,

				-- Resize mode keys
				resize_mode = {
					quit_key = "<ESC>",
					resize_keys = { "h", "j", "k", "l" },
					silent = true,
				},

				-- Multiplexer integration (tmux/wezterm)
				multiplexer_integration = "tmux", -- set to nil if you don't use tmux
			})

			-- ─── Keymaps ────────────────────────────────────────────────────────────
			-- Moving between splits (replaces the <C-h/j/k/l> from window-keymaps.lua)
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Window: go left" })
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Window: go down" })
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Window: go up" })
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Window: go right" })

			-- Resizing splits (replaces the <C-arrows> from window-keymaps.lua)
			vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Window: increase height" })
			vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Window: decrease height" })
			vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Window: decrease width" })
			vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Window: increase width" })

			-- Swapping buffers between windows
			vim.keymap.set("n", "<leader>wsh", require("smart-splits").swap_buf_left, { desc = "Swap buffer left" })
			vim.keymap.set("n", "<leader>wsj", require("smart-splits").swap_buf_down, { desc = "Swap buffer down" })
			vim.keymap.set("n", "<leader>wsk", require("smart-splits").swap_buf_up, { desc = "Swap buffer up" })
			vim.keymap.set("n", "<leader>wsl", require("smart-splits").swap_buf_right, { desc = "Swap buffer right" })
		end,
	},
}

-- lua/plugins/bufferline.lua
-- Bufferline shows open buffers as tabs at the top, with close buttons and icons
-- Combines well with telescope for finding buffers and navigation keymaps

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		keys = {
			-- Buffer navigation
			{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Buffer: prev" },
			{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Buffer: next" },
			{ "<leader>bf", "<cmd>BufferLineCycleNext<cr>", desc = "Buffer: forward/next" },
			{ "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Buffer: back/prev" },

			-- Move buffers left/right
			{ "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "Buffer: move left" },
			{ "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "Buffer: move right" },

			-- Pick a buffer to jump to (shows letters on each tab)
			{ "<leader>bs", "<cmd>BufferLinePick<cr>", desc = "Buffer: pick/select" },

			-- Close buffers
			{ "<leader>bc", "<cmd>bdelete<cr>", desc = "Buffer: close current" },
			{ "<leader>bC", "<cmd>BufferLinePickClose<cr>", desc = "Buffer: pick and close" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Buffer: close others" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Buffer: close all to right" },
			{ "<leader>bL", "<cmd>BufferLineCloseLeft<cr>", desc = "Buffer: close all to left" },

			-- Jump to buffer by position
			{ "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer: goto 1" },
			{ "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer: goto 2" },
			{ "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer: goto 3" },
			{ "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer: goto 4" },
			{ "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer: goto 5" },
			{ "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer: goto 6" },
			{ "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer: goto 7" },
			{ "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer: goto 8" },
			{ "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer: goto 9" },
			{ "<leader>b$", "<cmd>BufferLineGoToBuffer -1<cr>", desc = "Buffer: goto last" },

			-- Pin/unpin buffer (pinned buffers stay at the left)
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Buffer: toggle pin" },
		},
		opts = {
			options = {
				mode = "buffers", -- can also be "tabs"
				themable = true,
				numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon", -- can also be 'underline' | 'none'
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 18,
				diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center", -- "left" | "center" | "right"
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				persist_buffer_sort = true,
				separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current", -- 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
			},
		},
	},
}

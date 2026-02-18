-- lua/plugins/telescope.lua
-- Telescope fuzzy finder with better defaults and error handling

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				-- FZF native sorter for better performance
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		cmd = "Telescope",
		keys = {
			-- File pickers
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },

			-- Git pickers
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },

			-- LSP pickers
			{ "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP definitions" },
			{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },
			{ "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP implementations" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP document symbols" },

			-- Other
			{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		},
		opts = function()
			local actions = require("telescope.actions")

			return {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "truncate" },
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},

					-- Mappings
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-c>"] = actions.close,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-/>"] = actions.which_key,
						},
						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["?"] = actions.which_key,
						},
					},

					-- File ignore patterns
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"dist/",
						"build/",
						"target/",
						"%.lock",
					},

					-- Preview settings with error handling
					preview = {
						treesitter = true,
						-- Disable previewing for certain files to avoid errors
						filetype_hook = function(filepath, bufnr, opts)
							-- Don't preview binary files
							local excluded = vim.tbl_filter(function(ending)
								return filepath:match(ending)
							end, {
								"%.bin$",
								"%.jpg$",
								"%.jpeg$",
								"%.png$",
								"%.gif$",
								"%.zip$",
								"%.tar$",
								"%.gz$",
								"%.pdf$",
								"%.mp4$",
								"%.mkv$",
								"%.exe$",
								"%.dll$",
								"%.so$",
								"%.dylib$",
							})

							if not vim.tbl_isempty(excluded) then
								return false
							end

							return true
						end,
					},

					-- Border style
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

					-- Don't show line numbers in results
					set_env = { ["COLORTERM"] = "truecolor" },
				},

				pickers = {
					find_files = {
						hidden = true, -- show hidden files
						follow = true, -- follow symlinks
					},
					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},
					buffers = {
						sort_mru = true,
						sort_lastused = true,
						show_all_buffers = true,
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},
				},

				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- Load FZF extension if available
			pcall(telescope.load_extension, "fzf")
		end,
	},

	-- Telescope UI Select (make vim.ui.select use telescope)
	-- This is what's causing your error - we'll add better error handling
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- Disable preview to avoid the error you're seeing
							previewer = false,
							initial_mode = "normal",
							sorting_strategy = "ascending",
							layout_strategy = "cursor",
							layout_config = {
								width = 0.5,
								height = 0.4,
							},
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

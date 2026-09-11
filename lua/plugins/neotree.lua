return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File explorer" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		-- Only values that differ from neo-tree defaults
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			default_component_configs = {
				indent = {
					with_markers = false,
					expander_collapsed = "",
					expander_expanded = "",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
				},
				modified = { symbol = "[+]" },
				git_status = {
					symbols = {
						added = "",
						modified = "",
						renamed = "",
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				mappings = {
					["<esc>"] = "revert_preview",
				},
			},
			filesystem = {
				filtered_items = {
					hide_by_name = { "node_modules" },
					always_show = { ".gitignore" },
					never_show = { ".DS_Store" },
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				window = {
					mappings = {
						["<c-x>"] = "clear_filter",
					},
				},
			},
			git_status = {
				window = { position = "float" },
			},
		},
	},
}

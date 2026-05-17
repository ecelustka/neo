return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "LSP definitions" },
			{ "gD", "<cmd>vsp<cr><cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", desc = "LSP definitions (vsplit)" },
			{ "gr", function() require("telescope.builtin").lsp_references() end, desc = "LSP references" },
			{ "gi", function() require("telescope.builtin").lsp_implementations() end, desc = "LSP implementations" },
			{ "ge", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
						mappings = {
							["i"] = {},
							["n"] = {},
						},
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
		end,
	},
}

return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 400,
			spec = {
				{ "<leader>h", group = "harpoon" },
				{ "<leader>b", desc = "DAP breakpoint" },
				{ "<leader>B", desc = "DAP conditional breakpoint" },
				{ "<leader>e", desc = "Neotree toggle" },
				{ "<leader>f", desc = "Live grep" },
				{ "<leader>g", desc = "LazyGit" },
				{ "<leader>j", desc = "Move line down" },
				{ "<leader>k", desc = "Move line up" },
				{ "<leader>n", desc = "New vsplit" },
				{ "<leader>p", desc = "Find files" },
				{ "<leader>ui", desc = "DAP UI toggle" },
			},
		},
	},
}

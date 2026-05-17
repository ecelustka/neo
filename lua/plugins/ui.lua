return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = { "filetype" },
			},
			extensions = { "fzf", "neo-tree" },
		},
	},
}

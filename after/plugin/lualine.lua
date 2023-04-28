require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = { "filetype" },
	},
	extensions = { "fzf", "neo-tree" },
})

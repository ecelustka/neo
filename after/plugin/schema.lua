require("catppuccin").setup({
	flavour = "macchiato",
	styles = {
		conditionals = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		mason = true,
		neotree = true,
		telescope = true,
		treesitter = true,
		octo = true,
	},
})

vim.cmd.colorscheme("catppuccin")

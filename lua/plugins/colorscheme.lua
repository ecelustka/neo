return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "macchiato",
			integrations = {
				blink_cmp = true,
				gitsigns = true,
				mason = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				octo = true,
				which_key = true,
				harpoon = true,
				dap = true,
				dap_ui = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			-- flavour = "latte",
			flavour = "macchiato",
			-- Integrations listed explicitly; the default auto-detect calls
			-- vim.pack.get, which creates site/pack/core and trips checkhealth
			auto_integrations = false,
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

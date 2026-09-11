return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 400,
			-- Key descriptions live on the keymaps themselves; only groups here
			spec = {
				{ "<leader>h", group = "harpoon" },
				{ "<leader>G", group = "git hunks" },
			},
		},
	},
}

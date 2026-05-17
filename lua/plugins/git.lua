return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}

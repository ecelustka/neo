return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation (falls back to the built-in ]c/[c in diff mode)
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Next git hunk")
				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Prev git hunk")

				-- Actions
				map("n", "<leader>Gs", gitsigns.stage_hunk, "Stage/unstage hunk")
				map("n", "<leader>Gr", gitsigns.reset_hunk, "Reset hunk")
				map("v", "<leader>Gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage selection")
				map("v", "<leader>Gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset selection")
				map("n", "<leader>Gp", gitsigns.preview_hunk, "Preview hunk")
				map("n", "<leader>Gb", function()
					gitsigns.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>Gd", gitsigns.diffthis, "Diff buffer")
			end,
		},
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

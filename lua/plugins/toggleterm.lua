return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{ "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
			{ "<C-t>2", "<cmd>ToggleTerm 2<cr>", desc = "Toggle terminal 2" },
		},
		config = function()
			require("toggleterm").setup({})

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
				end,
			})
		end,
	},
}

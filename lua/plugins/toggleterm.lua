return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			-- Count-aware: <C-t> opens terminal 1, 2<C-t> terminal 2, etc.
			{ "<C-t>", "<cmd>execute v:count1 . 'ToggleTerm'<cr>", desc = "Toggle terminal" },
		},
		config = function()
			require("toggleterm").setup({})

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function(args)
					-- Lazygit handles <esc> itself (close menu / go back)
					if vim.api.nvim_buf_get_name(args.buf):match("lazygit") then
						return
					end
					vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = args.buf })
				end,
			})
		end,
	},
}

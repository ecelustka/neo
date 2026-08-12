return {
	{
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot", "CopilotToggle" },
		event = "InsertEnter",
		keys = {
			{ "<leader>ct", "<cmd>CopilotToggle<cr>", desc = "Toggle Copilot" },
		},
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = false,
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
				filetypes = {
					yaml = true,
					markdown = true,
					help = false,
					gitcommit = true,
					gitrebase = false,
					["."] = false,
				},
			})

			vim.keymap.set("i", ",,", function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(",,", true, false, true), "n", false)
				end
			end, { desc = "Copilot accept" })

			-- Off by default; <leader>ct enables on demand
			vim.g.copilot_enabled = false
			vim.cmd("Copilot disable")

			local function toggle_copilot()
				vim.g.copilot_enabled = not vim.g.copilot_enabled
				if vim.g.copilot_enabled then
					vim.cmd("Copilot enable")
					vim.notify("Copilot enabled", vim.log.levels.INFO)
				else
					vim.cmd("Copilot disable")
					vim.notify("Copilot disabled", vim.log.levels.WARN)
				end
			end

			vim.api.nvim_create_user_command("CopilotToggle", toggle_copilot, {})
		end,
	},
}

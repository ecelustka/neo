return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
			"theHamsta/nvim-dap-virtual-text",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
		},
		keys = {
			{ "<F5>", function() require("dap").continue() end, desc = "DAP continue" },
			{ "<F6>", function() require("dap").step_over() end, desc = "DAP step over" },
			{ "<F11>", function() require("dap").step_into() end, desc = "DAP step into" },
			{ "<F12>", function() require("dap").step_out() end, desc = "DAP step out" },
			{ "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
			{
				"<leader>B",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Conditional breakpoint",
			},
			{ "<leader>ui", function() require("dapui").toggle() end, desc = "DAP UI toggle" },
		},
		config = function()
			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "attach",
						processId = require("dap.utils").pick_process,
						name = "Attach debugger to existing `node --inspect` process",
						sourceMaps = true,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
						cwd = "${workspaceFolder}/src",
						skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
					},
					{
						type = "pwa-chrome",
						name = "Launch Chrome to debug client",
						request = "launch",
						url = "http://localhost:5173",
						sourceMaps = true,
						protocol = "inspector",
						port = 9222,
						webRoot = "${workspaceFolder}/src",
					},
					language == "javascript"
							and {
								type = "pwa-node",
								request = "launch",
								name = "Launch file in new node process",
								program = "${file}",
								cwd = "${workspaceFolder}",
							}
						or nil,
				}
			end

			require("dapui").setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = { close = { "q", "<Esc>" } },
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.5 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
						},
						position = "left",
						size = 50,
					},
					{
						elements = {
							{ id = "repl", size = 1 },
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true })
			end
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			require("nvim-dap-virtual-text").setup()

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
	},
}

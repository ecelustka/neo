require("dap-vscode-js").setup({
	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
	require("dap").configurations[language] = {
		-- attach to a node process that has been started with
		-- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
		-- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
		{
			-- use nvim-dap-vscode-js's pwa-node debug adapter
			type = "pwa-node",
			-- attach to an already running node process with --inspect flag
			-- default port: 9222
			request = "attach",
			-- allows us to pick the process using a picker
			processId = require("dap.utils").pick_process,
			-- name of the debug action you have to select for this config
			name = "Attach debugger to existing `node --inspect` process",
			-- for compiled languages like TypeScript or Svelte.js
			sourceMaps = true,
			-- resolve source maps in nested locations while ignoring node_modules
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
			-- path to src in vite based projects (and most other projects as well)
			cwd = "${workspaceFolder}/src",
			-- we don't want to debug code inside node_modules, so skip it!
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
			-- skip files from vite's hmr
			-- skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
		},
		-- only if language is javascript, offer this debug action
		language == "javascript"
				and {
					-- use nvim-dap-vscode-js's pwa-node debug adapter
					type = "pwa-node",
					-- launch a new process to attach the debugger to
					request = "launch",
					-- name of the debug action you have to select for this config
					name = "Launch file in new node process",
					-- launch current file
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
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = "",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.5,
				},
				{
					id = "breakpoints",
					size = 0.25,
				},
				{
					id = "stacks",
					size = 0.25,
				},
				-- {
				-- 	id = "watches",
				-- 	size = 0.25,
				-- },
			},
			position = "left",
			size = 50,
		},
		{
			elements = {
				{
					id = "repl",
					size = 1,
				},
				-- {
				-- 	id = "console",
				-- 	size = 0.5,
				-- },
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

-- Set keymaps to control the debugger
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F6>", require("dap").step_over)
vim.keymap.set("n", "<F11>", require("dap").step_into)
vim.keymap.set("n", "<F12>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
	vim.keymap.set("n", "<leader>ui", require("dapui").toggle)
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>ui", require("dapui").toggle)

-- Define signs for breakpoints
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

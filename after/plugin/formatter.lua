-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		css = {
			require("formatter.filetypes.css").prettier,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		lua = {
			require("formatter.filetypes.lua").luaformat,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

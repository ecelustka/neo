local lsp = require("lsp-zero")
local config = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	"eslint",
	"gopls",
	"lua_ls",
	"tsserver",
	"cssls",
	"html",
	"jsonls",
	"marksman",
	"stylelint_lsp",
	"svelte",
	"tailwindcss",
	"yamlls",
})

lsp.nvim_workspace()

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	float = true,
	underline = true,
})

config.eslint.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
		"astro",
	},
	settings = {
		format = false,
		codeActionsOnSave = {
			enable = true,
		},
	},
})

config.stylelint_lsp.setup({
	filetypes = {
		"css",
		"scss",
		"svelte",
	},
	settings = {
		stylelintplus = {
			autoFixOnFormat = false,
			autoFixOnSave = true,
			validateOnType = false,
		},
	},
})

local lsp = require("lsp-zero")
local config = require("lspconfig")
local util = require("lspconfig.util")

vim.opt.signcolumn = "yes"

lsp.preset("recommended")

lsp.ensure_installed({
	"eslint",
	"gopls",
	"lua_ls",
	"ts_ls",
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
	virtual_text = {
		errors = { "italic" },
		hints = { "italic" },
		warnings = { "italic" },
		information = { "italic" },
	},
	underlines = {
		errors = { "underline" },
		hints = { "underline" },
		warnings = { "underline" },
		information = { "underline" },
	},
	signs = true,
	update_in_insert = true,
	float = true,
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
		-- "svelte",
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

config.svelte.setup({
	on_attach = function(client)
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
			end,
		})
	end,
	settings = {
		svelte = {
			ui = {
				svelteKitFilesContextMenu = {
					enable = "never",
				},
			},
		},
	},
})

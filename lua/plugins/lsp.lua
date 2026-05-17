return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local servers = {
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
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_enable = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"shfmt",
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						diagnostics = { globals = { "vim" } },
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("eslint", {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
					"astro",
				},
				settings = {
					format = false,
					codeActionsOnSave = { enable = true },
				},
			})

			vim.lsp.config("stylelint_lsp", {
				filetypes = { "css", "scss", "svelte" },
				settings = {
					stylelintplus = {
						autoFixOnFormat = false,
						autoFixOnSave = true,
						validateOnType = false,
					},
				},
			})

			vim.lsp.config("svelte", {
				on_attach = function(client)
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end,
					})
				end,
				settings = {
					svelte = {
						ui = {
							svelteKitFilesContextMenu = { enable = "never" },
						},
					},
				},
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
				underline = true,
				update_in_insert = true,
				float = { border = "rounded" },
			})
		end,
	},
}

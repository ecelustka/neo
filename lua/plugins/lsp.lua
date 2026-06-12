return {
	{
		-- Proper lua_ls setup for editing the Neovim config: lazily feeds
		-- runtime + plugin sources instead of indexing everything up front.
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local servers = {
				"astro",
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
					"js-debug-adapter",
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
						-- library is provided lazily by lazydev.nvim
						workspace = { checkThirdParty = false },
						diagnostics = { globals = { "vim" } },
						telemetry = { enable = false },
					},
				},
			})

			-- filetypes come from the lspconfig default (js/ts/jsx/tsx, vue,
			-- svelte, astro, htmlangular)
			vim.lsp.config("eslint", {
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
				update_in_insert = false,
				float = { border = "rounded" },
			})
		end,
	},
}

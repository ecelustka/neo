return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- The `master` branch is frozen and does NOT support Neovim 0.12+.
		-- The `main` branch is the rewrite targeting Neovim 0.11/0.12.
		-- It needs the tree-sitter CLI to build parsers (`brew install tree-sitter-cli`).
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup()

			-- The `main` branch has no jsonc parser; the json one handles it fine.
			vim.treesitter.language.register("json", "jsonc")

			-- Curated set installed up front; everything else is installed
			-- automatically the first time you open a matching file (see autocmd below).
			local ensure_installed = {
				"bash",
				"css",
				"diff",
				"dockerfile",
				"gitcommit",
				"gitignore",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			}

			-- Asynchronous; a no-op for parsers that are already installed.
			ts.install(ensure_installed)

			-- Enable highlight + folding + indent for a buffer.
			local function ts_attach(buf)
				if not vim.api.nvim_buf_is_valid(buf) then
					return
				end
				pcall(vim.treesitter.start, buf)
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.api.nvim_buf_call(buf, function()
					vim.wo[0][0].foldmethod = "expr"
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldlevel = 99 -- start with folds open
				end)
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("ts_highlight", { clear = true }),
				callback = function(args)
					local buf = args.buf
					local ft = vim.bo[buf].filetype
					if ft == "" then
						return
					end

					local lang = vim.treesitter.language.get_lang(ft) or ft
					if not vim.tbl_contains(ts.get_available(), lang) then
						return
					end

					if vim.tbl_contains(ts.get_installed(), lang) then
						ts_attach(buf)
					else
						-- Parser missing: install in the background, attach when ready.
						ts.install({ lang }):await(function(err)
							if err then
								vim.notify("nvim-treesitter: " .. tostring(err), vim.log.levels.WARN)
								return
							end
							vim.schedule(function()
								ts_attach(buf)
							end)
						end)
					end
				end,
			})

			require("nvim-ts-autotag").setup({
				opts = {
					enable_close_on_slash = true, -- the other opts are default-on
				},
			})
		end,
	},
	{
		-- Textobjects for functions/classes/arguments (af/if, ac/ic, aa/ia)
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main", -- rewrite matching nvim-treesitter `main`
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
			})

			local function sel(query)
				return function()
					require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
				end
			end
			local map = vim.keymap.set
			map({ "x", "o" }, "af", sel("@function.outer"), { desc = "Around function" })
			map({ "x", "o" }, "if", sel("@function.inner"), { desc = "Inside function" })
			map({ "x", "o" }, "ac", sel("@class.outer"), { desc = "Around class" })
			map({ "x", "o" }, "ic", sel("@class.inner"), { desc = "Inside class" })
			map({ "x", "o" }, "aa", sel("@parameter.outer"), { desc = "Around argument" })
			map({ "x", "o" }, "ia", sel("@parameter.inner"), { desc = "Inside argument" })
		end,
	},
	{
		-- Sticky header with the current function/class at the top of the window
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("treesitter-context").setup({ max_lines = 3 })
		end,
	},
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
	end,
})

autocmd("BufWritePre", {
	group = augroup("EslintFixOnSave", { clear = true }),
	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.mjs", "*.cjs", "*.svelte", "*.vue", "*.astro" },
	command = "silent! EslintFixAll",
})

autocmd("BufWritePost", {
	group = augroup("ConformFormatOnSave", { clear = true }),
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, async = true, lsp_fallback = true })
	end,
})

autocmd({ "BufNewFile", "BufRead" }, {
	group = augroup("EnvFiletype", { clear = true }),
	pattern = ".env.*",
	command = "set filetype=sh",
})

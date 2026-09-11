local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 700 })
	end,
})

autocmd("BufWritePre", {
	group = augroup("EslintFixOnSave", { clear = true }),
	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.mjs", "*.cjs", "*.svelte", "*.vue", "*.astro" },
	command = "silent! LspEslintFixAll",
})

-- Runs after the eslint autocmd above (same event, defined later), then the
-- buffer is written already formatted.
autocmd("BufWritePre", {
	group = augroup("ConformFormatOnSave", { clear = true }),
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_format = "fallback" })
	end,
})

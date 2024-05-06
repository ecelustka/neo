require("conform").setup({
	formatters_by_ft = {
		astro = { "prettier" },
		css = { "prettier" },
		gp = { "gofmt" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		sh = { "shfmt" },
		svelte = { "prettier" },
		terraform = { "terraform_fmt" },
		typescript = { "prettier" },
		yaml = { "prettier" },
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		-- javascript = { { "prettierd", "prettier" } },
	},
})

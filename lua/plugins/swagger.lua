return {
	{
		"vinnymeller/swagger-preview.nvim",
		build = "npm install -g swagger-ui-watcher",
		cmd = { "SwaggerPreview", "SwaggerPreviewToggle" },
		opts = {
			port = 5555,
			host = "localhost",
		},
	},
}

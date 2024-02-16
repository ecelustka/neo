return require("lazy").setup({
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	-- Color schema
	{ "catppuccin/nvim", name = "catppuccin" },
	"kyazdani42/nvim-web-devicons",

	-- Status bar
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	-- Git
	"nvim-lua/plenary.nvim",
	{ "lewis6991/gitsigns.nvim", lazy = true },
	{ "kdheepak/lazygit.nvim" },

	-- Comments
	{ "numToStr/Comment.nvim", lazy = true },

	-- TODO
	-- "tpope/vim-fugitive",
	-- "mfussenegger/nvim-dp",
	-- "theHamsta/nvim-dap-virtual-text",
	-- "rcarriga/nvim-dap-ui",
	--
	-- LSP and autocomplete
	{ "nvim-treesitter/nvim-treesitter" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{ "mhartington/formatter.nvim", lazy = true },
	-- "ThePrimeagen/harpoon",
	--
	-- TreeFile view
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	-- Copilot
	{ "zbirenbaum/copilot.lua", lazy = true },

	-- DAP
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
			"theHamsta/nvim-dap-virtual-text",
			-- lazy spec to build "microsoft/vscode-js-debug" from source
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
		},
	},

	-- Toggleterm
	{ "akinsho/toggleterm.nvim", version = "*", config = true, lazy = true },

	-- Others
	{ "windwp/nvim-autopairs", lazy = true },
	{ "pwntester/octo.nvim", lazy = true },
	{ "ray-x/lsp_signature.nvim", lazy = true },
	{ "AndrewRadev/tagalong.vim", lazy = true },
	{ "tpope/vim-surround", lazy = true },
})

return require("lazy").setup({
	-- Startup time
	"lewis6991/impatient.nvim",

	-- Telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-file-browser.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Color schema
	"gruvbox-community/gruvbox",
	"kyazdani42/nvim-web-devicons",

	-- Status bar
	"nvim-lualine/lualine.nvim",

	-- Git
	"nvim-lua/plenary.nvim",
	"lewis6991/gitsigns.nvim",
	"kdheepak/lazygit.nvim",

	-- Comments
	"numToStr/Comment.nvim",

	-- TODO
	-- "tpope/vim-fugitive",
	-- "mfussenegger/nvim-dp",
	-- "theHamsta/nvim-dap-virtual-text",
	-- "rcarriga/nvim-dap-ui",
	--
	-- LSP and autocomplete
	"dnlhc/glance.nvim",
	{ "nvim-treesitter/nvim-treesitter" },
	-- { "nvim-treesitter/nvim-treesitter", { build = ":TSUpdate" }},
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
			{ "rafamadriz/friendly-snippets" },
		},
	},
	"mhartington/formatter.nvim",
	-- "ThePrimeagen/harpoon",
	--
	-- TreeFile view
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	-- Rest
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- Copilot
	"zbirenbaum/copilot.lua",

	-- Others
	"windwp/nvim-autopairs",
	"pwntester/octo.nvim",
	"machakann/vim-highlightedyank",
	"ray-x/lsp_signature.nvim",
	"AndrewRadev/tagalong.vim",
	"tpope/vim-surround",
})

return {
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		config = function()
			require("neodev").setup({})
		end,
	},
	{
		"xiantang/nvim-lspconfig",
		event = "BufRead",
		-- use commit
		dependencies = {
			"j-hui/fidget.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"glepnir/lspsaga.nvim",
			"onsails/lspkind.nvim",
			-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
			"folke/neodev.nvim",
		},
		opts = {
			servers = {
				dartls = {},
			},
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{ "onsails/lspkind.nvim", event = "VeryLazy" },
	{ "glepnir/lspsaga.nvim", commit = "b7b4777", event = "VeryLazy" },
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"vue-language-server",
				"eslint-lsp",
				"tailwindcss",
				"prettierd",
				"html-lsp",
				"stylua",
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{ "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
}

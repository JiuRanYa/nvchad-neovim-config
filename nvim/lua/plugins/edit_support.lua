return {
	{
		"windwp/nvim-autopairs",
		lazy = true,
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"Pocco81/auto-save.nvim",
		event = "VeryLazy",
		config = function()
			require("auto-save").setup({
				enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
				debounce_delay = 200,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "RRethy/vim-illuminate", event = "VeryLazy" },
	{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
}

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({})
		end,
		event = "VeryLazy",
	},
}

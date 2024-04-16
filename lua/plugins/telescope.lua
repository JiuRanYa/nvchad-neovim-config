return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<Leader>f", "<cmd>Telescope find_files hidden=true<CR>", {} },
		{ "<Leader>p", ":Telescope live_grep<CR>", {} },
		{ "<Leader>o", ":Telescope lsp_document_symbols<CR>", {} },
		{ "<Leader>rs", ":Telescope resume<CR>", {} },
		{ "<C-q>", ":Telescope oldfiles<CR>", {} },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
			},
			pickers = {
				live_grep = {
					additional_args = function(opt)
						return { "--hidden" }
					end,
				},
			},
		})
	end,
}

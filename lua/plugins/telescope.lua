return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<Leader>f", "<cmd>Telescope find_files hidden=true<CR>", {} },
		{ "<Leader>o", ":Telescope lsp_document_symbols<CR>", {} },
		{ "<Leader>rs", ":Telescope resume<CR>", {} },
		{ "<C-q>", ":Telescope oldfiles<CR>", {} },
	},
	opts = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "es", "lib", "dist" },
			},
			pickers = {
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
				},
			},
		})
	end,
}

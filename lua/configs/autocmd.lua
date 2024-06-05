-- 复制时高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- 代码折叠
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- treesitter illuminate
vim.cmd("hi IlluminatedWordRead guibg=#525252 gui=none")

vim.g.vsnip_filetypes = {
	typescriptreact = { "javascript", "typescript", "typescriptreact" },
	typescript = { "javascript", "typescript", "typescriptreact" },
}
--
function open_folder_in_finder()
	local api = require("nvim-tree.api")
	local node = api.tree.get_node_under_cursor()

	local filepath = node.absolute_path
	local escaped_path = vim.fn.shellescape(filepath)
	local command = string.format("open -R %s", escaped_path)
	vim.fn.system(command)
end

-- 将该函数映射到一个合适的按键，例如 F2
vim.api.nvim_set_keymap("n", "<leader>of", ":lua open_folder_in_finder()<CR>", { noremap = true, silent = true })

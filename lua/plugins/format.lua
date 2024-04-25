return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				vue = { "prettier" },
				python = { "isort", "black" },
			},
		})

		-- vim.keymap.set({ "n", "v" }, "<C-s>", function()
		-- 	conform.format({
		-- 		lsp_fallback = true,
		-- 		async = false,
		-- 		timeout_ms = 1000,
		-- 	})
		-- end, { desc = "Format file or range (in visual mode)" })
	end,
}

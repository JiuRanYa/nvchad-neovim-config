-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "volar", "eslint-lsp", "prettier", "tailwindcss" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- typescript
lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "json" },
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	init_options = {},
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = false,
			},
		},
	},
})

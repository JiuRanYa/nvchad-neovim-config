-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "volar", "eslint", "tailwindcss" }

local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"

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
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "json", "vue" },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
			},
		},
	},
})

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = false,
			},
		},
	},
})

-- EXAMPLE
local on_attach = require("override.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local mason_registry = require("mason-registry")
local util = require("lspconfig.util")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"

local servers = { "html", "cssls", "volar", "eslint", "tailwindcss" }

local function get_typescript_server_path(root_dir)
	-- local global_ts = "/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib"
	local global_ts = "/Users/jiuran/.config/nvm/versions/node/v20.11.1/lib/node_modules/typescript/lib"
	-- Alternative location if installed as root:
	-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end
	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

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
	capabilities = capabilities,
	root_dir = util.root_pattern(
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json",
		"eslint.config.mjs",
		"eslint.config.js",
		-- Disabled to prevent "No ESLint configuration found" exceptions
		"package.json"
	),
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		packageManager = "pnpm",
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
	-- root_dir = util.find_git_ancestor,
	on_attach = function(client, bufnr) end,
})

lspconfig.tsserver.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue", "typescript" },
			},
		},
	},
})

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	on_attach = on_attach,
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
	init_options = {
		languageFeatures = {
			references = true,
			definition = true,
			typeDefinition = true,
			callHierarchy = true,
			hover = true,
			rename = true,
			signatureHelp = true,
			codeAction = true,
			completion = {
				defaultTagNameCase = "both",
				defaultAttrNameCase = "kebabCase",
				getDocumentNameCasesRequest = true,
				getDocumentSelectionRequest = true,
			},
			documentLink = true,
			codeLens = true,
			diagnostics = true,
		},
	},
	on_new_config = function(new_config, new_root_dir)
		new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
	end,
	-- init_options = {
	-- 	vue = {
	-- 		hybridMode = false,
	-- 	},
	-- },
})

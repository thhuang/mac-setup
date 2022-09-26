local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("lspconfig not found!")
	return
end

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	vim.notify("mason not found!")
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	vim.notify("mason-lspconfig not found!")
	return
end

local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
	vim.notify("ruslt-tools not found!")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"html",
		"jsonls",
		"racket_langserver",
		"rust_analyzer",
		"sumneko_lua",
		"tailwindcss",
		"tsserver",
	},
	automatic_installation = true,
})

local opts = {
	on_attach = require("th.lsp.handlers").on_attach,
	capabilities = require("th.lsp.handlers").capabilities,
}

-- C++
lspconfig.clangd.setup(vim.tbl_deep_extend("force", require("th.lsp.settings.clangd"), opts))

-- JSON
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("th.lsp.settings.jsonls"), opts))

-- Lua
lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", require("th.lsp.settings.sumneko_lua"), opts))

-- Racket
lspconfig.racket_langserver.setup(opts)

-- Rust
rust_tools.setup({
	server = vim.tbl_deep_extend("force", require("th.lsp.settings.rust_analyzer"), opts),
})

-- Tailwind
lspconfig.tailwindcss.setup({})

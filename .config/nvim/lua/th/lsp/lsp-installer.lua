local lsp_installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_status_ok then
	vim.notify("nvim-lsp-installer not found!")
	return
end

local rust_tool_status_ok, rust_tool = pcall(require, "rust-tools")
if not rust_tool_status_ok then
	vim.notify("ruslt-tools not found!")
	return
end
rust_tool.setup({})

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("th.lsp.handlers").on_attach,
		capabilities = require("th.lsp.handlers").capabilities,
	}

	if server.name == "clangd" then
		local clangd_opts = require("th.lsp.settings.clangd")
		opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	end

	if server.name == "jsonls" then
		local jsonls_opts = require("th.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("th.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "rust_analyzer" then
		-- Initialize the LSP via rust-tools instead
		require("rust-tools").setup({
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
		return
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

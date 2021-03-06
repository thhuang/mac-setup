local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- cpp
		formatting.clang_format.with({ extra_args = { "--style", "{BasedOnStyle: Google, IndentWidth: 4}" } }),

		-- lua
		formatting.stylua,

		-- javascript
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

		-- python
		formatting.yapf,
		diagnostics.flake8,
	},
})

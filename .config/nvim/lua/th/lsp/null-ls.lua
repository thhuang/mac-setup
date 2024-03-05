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
		formatting.prettier.with({ extra_args = { "--single-quote" } }),

		-- python
		formatting.yapf.with({
			extra_args = { "--style", "{based_on_style: google, column_limit: 120, indent_width: 4}" },
		}),
		diagnostics.flake8.with({
			extra_args = { "--max-line-length", "120" },
		}),
	},
})

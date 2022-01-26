local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found!")
  return
end

require "th.lsp.lsp-installer"
require("th.lsp.handlers").setup()
require "th.lsp.null-ls"

local colorscheme = "tokyonight-night"

vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "terminal", "packer" }

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

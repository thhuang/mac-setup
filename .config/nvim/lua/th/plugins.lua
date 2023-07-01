local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("tpope/vim-commentary") -- For commenting with gcc & gc
	use("windwp/nvim-autopairs") -- Auto-pairs that supports multiple characters
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }) -- Preview a markdown file in realtime
	use("lewis6991/gitsigns.nvim") -- Git
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Fuzzy finder
	use({ "numToStr/Comment.nvim", tag = "v0.6" }) -- Comment
	use("kyazdani42/nvim-web-devicons") -- Icons
	use("kyazdani42/nvim-tree.lua") -- File navigator
	use("akinsho/bufferline.nvim") -- Buffer line
	use("moll/vim-bbye") -- Close buffers without closing the window
	use("akinsho/toggleterm.nvim") -- Terminal
	use("nvim-lualine/lualine.nvim") -- Status line
	use("lukas-reineke/indent-blankline.nvim") -- Indentation guides
	use("qpkorr/vim-bufkill") -- Delete a buffer without closing the split or window with BD

	-- Landing page
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- For fixing lsp doc highlight

	-- Colorschemes
	use("folke/tokyonight.nvim")
	use("pbrisbin/vim-colors-off")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- Snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- Nvim LSP completions
	use("hrsh7th/cmp-nvim-lua") -- Nvim Lua completions
	use("Saecki/crates.nvim") -- Nvim crates.io completions

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- Enable LSP
	use("williamboman/mason.nvim") -- Simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- mason extension
	use("jose-elias-alvarez/null-ls.nvim") -- Formatters and linters

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("ahmedkhalf/project.nvim")

	-- Rust
	use({ "simrat39/rust-tools.nvim", requires = { "mfussenegger/nvim-dap", "nvim-lua/plenary.nvim" } })

	-- Go
	use({ "fatih/vim-go", run = ":GoUpdateBinaries" })

	-- Java
	use("mfussenegger/nvim-jdtls")

	-- Bison, flex, and RE-flex
	use("justinmk/vim-syntax-extra")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

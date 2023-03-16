local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 4 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 4 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	foldmethod = "indent",
	foldlevel = 20,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- For making complex changes on multiple lines
-- References:
-- - https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
-- - https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
vim.cmd([[
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction
]])

-- For html files
vim.cmd([[autocmd Filetype html setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For css files
vim.cmd([[autocmd Filetype css setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For scss files
vim.cmd([[autocmd Filetype scss setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For js files
vim.cmd([[autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For jsx files
vim.cmd([[autocmd Filetype javascriptreact setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For tsx files
vim.cmd([[autocmd Filetype typescriptreact setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For json files
vim.cmd([[autocmd Filetype json setlocal shiftwidth=2 tabstop=2 expandtab]])

-- For scheme
vim.cmd([[autocmd Filetype scheme setlocal shiftwidth=2 tabstop=2 expandtab]])

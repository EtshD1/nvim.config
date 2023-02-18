local o = vim.o

-- Make line numbers default
vim.wo.number = true
-- Make line numbers relative
o.relativenumber = true
-- Enable break indent
o.breakindent = true
-- Save undo history
o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
-- Decrease update time
o.updatetime = 250
vim.wo.signcolumn = 'yes'
-- Set colorscheme
o.termguicolors = true
-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'
-- Tabs and indenting
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
-- Line wrapping
o.wrap = false
-- Cursor line
o.cursorline = true
-- Terminal Colors
o.termguicolors = true
o.background = "dark"

o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.incsearch = true

o.scrolloff = 14
o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

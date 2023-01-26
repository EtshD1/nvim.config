local opt = vim.opt

-- Line Numbers
opt.nu = true
opt.relativenumber = true

-- Tabs and indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case-sensitive Search
-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.termguicolors = true
opt.background = "dark"
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

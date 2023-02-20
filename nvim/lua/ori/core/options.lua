local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false
opt.linebreak = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false
opt.scrolloff = 8

-- appearance
opt.termguicolors = true
opt.cmdheight = 2
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- might need xclip to be installed to work
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- backup & swap
opt.swapfile = false

-- misc
opt.iskeyword:append("-") -- string-string as one word

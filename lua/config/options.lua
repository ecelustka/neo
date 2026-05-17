local opt = vim.opt
local g = vim.g

opt.autoread = true
opt.backspace = "indent,eol,start"
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.encoding = "utf-8"
opt.expandtab = true
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.lazyredraw = true
opt.mouse = "n"
opt.number = true
opt.ruler = true
opt.shiftwidth = 4
opt.sidescroll = 1
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitright = true
opt.tabstop = 4
opt.ttyfast = true
opt.wrap = false

g.backup = false
g.compatible = false
g.showmode = false
g.swapfile = false
g.writebackup = false
g.t_Co = 256
g.undodir = "~/.vim/undodir"
g.undofile = true
g.updatetime = 300
g.virtualedit = "all"
g.visualbell = true

g.tagalong_additional_filetypes = { "svelte", "astro" }

vim.cmd("syntax on")

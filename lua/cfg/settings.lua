vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start" -- allow backspacing over everything in insert mode
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true -- confirm before exiting
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.hidden = true -- hide the insert text"
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- ignore case
vim.opt.incsearch = true -- do incremental searching
vim.opt.lazyredraw = true
vim.opt.mouse = "n" -- mouse support
vim.g.nobackup = true
vim.g.nocompatible = true
vim.g.noshowmode = true
vim.g.noswapfile = true
vim.wo.wrap = false
vim.g.nowritebackup = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.shiftwidth = 4
vim.opt.sidescroll = 1
vim.opt.smartcase = true -- but don't ignore it, when search string contains uppercase letters
vim.opt.smartindent = true
vim.opt.splitright = true
vim.g.t_Co = 256
vim.opt.tabstop = 4
vim.opt.ttyfast = true
vim.g.undodir = "~/.vim/undodir" -- undo directory (undo even after restart)
vim.g.undofile = true
vim.g.updatetime = 300
vim.g.virtualedit = "all"
vim.g.visualbell = true

vim.cmd([[
    syntax on
    autocmd BufNewFile,BufRead .env.* set filetype=sh
]])

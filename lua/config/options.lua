local opt = vim.opt

-- No remote plugins in use; skipping provider detection quiets
-- checkhealth and shaves a bit off startup
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

opt.backup = false
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.mouse = "n"
opt.number = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.showmode = false
opt.sidescroll = 1
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.undofile = true -- persistent undo, stored in stdpath("state")/undo
opt.updatetime = 300
opt.virtualedit = "all"
opt.visualbell = true
opt.winborder = "rounded"
opt.wrap = false
opt.writebackup = false

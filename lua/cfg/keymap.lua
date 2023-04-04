vim.g.mapleader = ","
vim.g.tagalong_additional_filetypes = { "svelte" }

-- Lazygit
vim.keymap.set("n", "<leader>g", ":LazyGit<CR>")

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- Telescope
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>")

-- Delete without yanks
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("v", "D", '"_D')

-- Replace text without yanks
vim.keymap.set("v", "p", '"_dP')
--

-- Move around windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- LSP
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", ":vsp<cr><cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "D", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Create new window
vim.keymap.set("n", "<leader>n", ":botright vnew<CR>")

-- Move code by lines
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")

-- Fomrat on save and run EslintFixAll
vim.cmd([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.svelte,*.vue EslintFixAll
      autocmd BufWritePost * FormatWrite
    augroup END

]])

local map = vim.keymap.set

-- Delete without yanks
map("n", "d", '"_d')
map("n", "D", '"_D')
map("n", "x", '"_x')
map("v", "x", '"_x')
map("v", "d", '"_d')
map("v", "D", '"_D')

-- Replace text without yanks
map("v", "p", '"_dP')

-- Move around windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Diagnostics (LSP-related but global)
map("n", "D", vim.diagnostic.open_float)
map("n", "K", vim.lsp.buf.hover)

-- Create new window
map("n", "<leader>n", ":botright vnew<CR>")

-- Move code by lines
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")
map("v", "<leader>j", ":m '>+1<CR>gv=gv")
map("v", "<leader>k", ":m '<-2<CR>gv=gv")

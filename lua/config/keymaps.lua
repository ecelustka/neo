local map = vim.keymap.set

-- Delete without yanks
-- (normal-mode D is taken by the diagnostics float below)
map("n", "d", '"_d')
map("n", "x", '"_x')
map("v", "x", '"_x')
map("v", "d", '"_d')
map("v", "D", '"_D')

-- Replace text without yanks (built-in visual P keeps the register)
map("x", "p", "P")

-- Move around windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Diagnostics (LSP-related but global; built-in K already does LSP hover)
map("n", "D", vim.diagnostic.open_float)

-- LSP actions
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Drop built-in gr* LSP maps so the Telescope `gr` mapping fires without
-- waiting for timeoutlen (rename/code action live on <leader> instead)
for _, lhs in ipairs({ "grr", "grn", "gra", "gri", "grt" }) do
	pcall(vim.keymap.del, "n", lhs)
end
pcall(vim.keymap.del, "x", "gra")

-- Create new window
map("n", "<leader>n", "<cmd>botright vnew<cr>")

-- Move code by lines
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")
map("v", "<leader>j", ":m '>+1<CR>gv=gv")
map("v", "<leader>k", ":m '<-2<CR>gv=gv")

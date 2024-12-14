local harpoon = require("harpoon")

vim.opt.signcolumn = "yes"
vim.g.mapleader = ","
vim.g.tagalong_additional_filetypes = { "svelte", "astro" }

vim.keymap.set("i", ",,", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- Lazygit
vim.keymap.set("n", "<leader>g", ":LazyGit<CR>")

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- Telescope
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")

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
vim.keymap.set("n", "gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>")
vim.keymap.set("n", "gD", ":vsp<cr> :lua require'telescope.builtin'.lsp_definitions{}<CR>")
vim.keymap.set("n", "D", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>")
vim.keymap.set("n", "gr", ":lua require'telescope.builtin'.lsp_references{}<CR>")
vim.keymap.set("n", "gi", ":lua require'telescope.builtin'.lsp_implementations{}<CR>")
vim.keymap.set("n", "ge", ":Telescope diagnostics<CR>")

-- DAP
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F6>", require("dap").step_over)
vim.keymap.set("n", "<F11>", require("dap").step_into)
vim.keymap.set("n", "<F12>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
	vim.keymap.set("n", "<leader>ui", require("dapui").toggle)
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>ui", require("dapui").toggle)

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
      autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.mjs,*.cjs,*.svelte,*.vue,*.astro EslintFixAll
    augroup END

    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
    augroup END
]])

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, async = true, lsp_fallback = true })
	end,
})

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>hD", function()
	harpoon:list():clear()
end)

vim.keymap.set("n", "<leader>he", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end)

-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-s-p>", function()
-- 	harpoon:list():prev()
-- end)
-- vim.keymap.set("n", "<C-s-n>", function()
-- 	harpoon:list():next()
-- end)

require("toggleterm").setup({})

vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
vim.keymap.set("n", "<C-t>2", ":ToggleTerm 2<CR>")

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

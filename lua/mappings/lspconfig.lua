vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "LSP formatting" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
	desc = "LSP code action",
})

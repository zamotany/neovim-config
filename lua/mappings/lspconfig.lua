vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "LSP formatting" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
	desc = "LSP code action",
})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {
	desc = "LSP hover",
})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "LSP rename",
})
vim.keymap.set({ "n" }, "<leader>k", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

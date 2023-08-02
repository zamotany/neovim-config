vim.keymap.set("n", "<C-n>", require("nvim-tree.api").tree.toggle, { desc = "Toggle nvimtree" })
vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.focus, { desc = "Focus nvimtree" })

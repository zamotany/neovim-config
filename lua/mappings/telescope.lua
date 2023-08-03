local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fa", function()
	builtin.find_files({
		follow = true,
		no_ignore = true,
		hidden = true,
	})
end, { desc = "Find all" })
vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({
    cwd = vim.fn.getcwd() .. "/node_modules",
		file_ignore_patterns = {},
		find_command = { "rg", "--no-ignore", "--no-hidden", "--files" },
	})
end, { desc = "Find in node_modules" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help page" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find oldfiles" })

vim.keymap.set(
	"n",
	"<leader>ps",
	require("auto-session.session-lens").search_session,
	{ desc = "Persisted sessions", nowait = true, silent = true }
)
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter symbols" })

vim.keymap.set("n", "<leader>cm", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gt", function()
	builtin.git_status({
		initial_mode = "normal",
	})
end, { desc = "Git status" })
vim.keymap.set("n", "<leader>st", builtin.git_stash, { desc = "Git stash" })
vim.keymap.set("n", "<leader>br", builtin.git_branches, { desc = "Git branches" })

vim.keymap.set("n", "gd", function()
	builtin.lsp_definitions({
		initial_mode = "normal",
	})
end, { desc = "LSP definitions" })
vim.keymap.set("n", "gr", function()
	builtin.lsp_references({
		initial_mode = "normal",
	})
end, { desc = "LSP references" })
vim.keymap.set("n", "gi", function()
	builtin.lsp_implementations({
		initial_mode = "normal",
	})
end, { desc = "LSP implementations" })
vim.keymap.set("n", "<leader>D", function()
	builtin.lsp_type_definitions({
		initial_mode = "normal",
	})
end, { desc = "LSP type definitions" })
vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics({
		initial_mode = "normal",
	})
end, { desc = "LSP diagnostics" })

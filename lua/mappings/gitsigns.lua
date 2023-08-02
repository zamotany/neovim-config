local gs = require("gitsigns")

local function next_hunk()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
	return "<Ignore>"
end

local function prev_hunk()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
	return "<Ignore>"
end

vim.keymap.set("n", "]c", next_hunk, { desc = "Jump to next hunk", expr = true })
vim.keymap.set("n", "[c", prev_hunk, { desc = "Jump to prev hunk", expr = true })
vim.keymap.set("n", "<leader>ph", gs.preview_hunk, { desc = "Preview hunks" })
vim.keymap.set("n", "<leader>rh", gs.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>sh", gs.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>sH", gs.stage_buffer, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gb", gs.blame_line, { desc = "Blame line" })

vim.keymap.set("v", "<leader>hs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
vim.keymap.set("v", "<leader>hr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

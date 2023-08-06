function next_buffer()
  require("bufferline").cycle(1)
end

function prev_buffer()
  require("bufferline").cycle(-1)
end

function close_buffer()
  require("bufferline").unpin_and_close()
  require("bufferline").cycle(-1)
end

vim.keymap.set("n", "<tab>", next_buffer, { desc = "Next buffer" })
vim.keymap.set("n", "<S-tab>", prev_buffer, { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>b", ":enew<cr>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>x", close_buffer, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>X", require("bufferline").close_others, { desc = "Close other buffers" })

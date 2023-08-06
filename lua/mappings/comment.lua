vim.keymap.set("n", "<leader>/", require("Comment.api").toggle.linewise.current, { desc = "Toggle comment" })
vim.keymap.set(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment" }
)

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  require("nvterm.terminal").toggle("float")
end, { desc = "Toggle floating terminal", noremap = true, silent = true })

vim.keymap.set({ "n", "t" }, "<leader>th", function()
  require("nvterm.terminal").toggle("horizontal")
end, { desc = "Toggle horizontal terminal", noremap = true, silent = true })

vim.keymap.set({ "n", "t" }, "<leader>tv", function()
  require("nvterm.terminal").toggle("vertical")
end, { desc = "Toggle vertical terminal", noremap = true, silent = true })

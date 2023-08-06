local M = {
  is_open = false
}

vim.keymap.set({ "n", "v" }, "<leader>dv", function()
  if M.is_open then
    vim.cmd("DiffviewClose")
    M.is_open = false
  else
    vim.cmd("DiffviewOpen")
    M.is_open = true
  end
end, { desc = "Toggle diffview" })
vim.keymap.set({ "n", "v" }, "<leader>dr", ":DiffviewRefresh<cr>", { desc = "Refresh diffview", silent = true })

return M

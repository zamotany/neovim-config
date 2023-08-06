local autocmd = vim.api.nvim_create_autocmd

-- Dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

local lazy_did_show_install_view = false

local function auto_session_restore()
  vim.schedule(function()
    require("auto-session").AutoRestoreSession()
  end)
end

autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local lazy_view = require("lazy.view")

    if lazy_view.visible() then
      lazy_did_show_install_view = true
    else
      auto_session_restore()
    end
  end,
})

autocmd("WinClosed", {
  pattern = "*",
  callback = function(ev)
    local lazy_view = require("lazy.view")

    if lazy_view.visible() and lazy_did_show_install_view then
      if ev.match == tostring(lazy_view.view.win) then
        lazy_did_show_install_view = false
        auto_session_restore()
      end
    end
  end,
})

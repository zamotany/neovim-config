local mappings = require("mappings.diffview")

local options = {
	hooks = {
		diff_buf_read = function()
			vim.opt_local.wrap = false
		end,
		view_opened = function()
      mappings.is_open = true
		end,
		view_closed = function()
      mappings.is_open = false
		end,
	},
}

return options

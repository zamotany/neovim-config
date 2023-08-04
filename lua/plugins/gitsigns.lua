local utils = require("core.utils")

local options = {
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "󰍵" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "│" },
	},
	preview_config = {
		border = utils.border("GitSignsBorder"),
	},
	-- on_attach = function(bufnr)
	--   utils.load_mappings("gitsigns", { buffer = bufnr })
	-- end,
}

return options

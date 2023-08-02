local options = {
	flavour = "frappe",
	highlight_overrides = {
		all = function(colors)
			return {
				CmpDocBorder = { fg = colors.surface0, bg = colors.crust },
				CmpDoc = { bg = colors.crust },
				CmpPmenu = { bg = colors.crust },
				CmpBorder = { fg = colors.surface0, bg = colors.crust },
				CmpSel = { link = "PmenuSel", bold = true },
			}
		end,
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		which_key = true,
	},
}

return options

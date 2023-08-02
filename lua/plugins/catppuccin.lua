local options = {
	flavour = "frappe",
	highlight_overrides = {
		all = function(colors)
			return {
				NormalFloat = { fg = colors.text, bg = colors.crust },
				FloatBorder = { fg = colors.surface0, bg = colors.crust },
				FloatTitle = { fg = colors.subtext0 },
				CmpDocBorder = { link = "FloatBorder" },
				CmpDoc = { bg = colors.crust },
				CmpPmenu = { bg = colors.crust },
				CmpBorder = { link = "FloatBorder" },
				CmpSel = { link = "PmenuSel", bold = true },
				GitSingsBorder = { link = "FloatBorder" },
				GitSignsAdd = { fg = colors.green },
				GitSignsChange = { fg = colors.yellow },
				GitSingsDelete = { fg = colors.red },
				GitSignsAddPreview = { fg = colors.green },
				GitSignsDeletePreview = { fg = colors.red },
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

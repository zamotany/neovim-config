local options = {
	flavour = "macchiato",
	dim_inactive = {
		enabled = true,
		shade = "light",
		percentage = 0.2,
	},
	highlight_overrides = {
		all = function(colors)
			return {
				NormalFloat = { fg = colors.text, bg = colors.crust },
				FloatBorder = { fg = colors.mantle, bg = colors.crust },
				FloatTitle = { fg = colors.sky, bg = colors.crust, bold = true },
				CodeActionBorder = { fg = colors.crust, bg = colors.crust },
				-- Cmp customizations
				CmpDocBorder = { link = "FloatBorder" },
				CmpDoc = { bg = colors.crust },
				CmpPmenu = { bg = colors.crust },
				CmpBorder = { link = "FloatBorder" },
				CmpSel = { link = "PmenuSel", bold = true },
				-- Gitsigns customizations
				GitSingsBorder = { link = "FloatBorder" },
				GitSignsAdd = { fg = colors.green },
				GitSignsChange = { fg = colors.yellow },
				GitSingsDelete = { fg = colors.red },
				GitSignsAddPreview = { fg = colors.green },
				GitSignsDeletePreview = { fg = colors.red },
				-- Telescope customizations
				TelescopeBorder = {
					fg = colors.crust,
					bg = colors.crust,
				},
				TelescopePromptBorder = {
					fg = colors.mantle,
					bg = colors.mantle,
				},
				TelescopePromptPrefix = {
					fg = colors.red,
					bg = colors.mantle,
				},
				TelescopePromptNormal = {
					fg = colors.text,
					bg = colors.mantle,
				},
				TelescopeNormal = { bg = colors.crust },
				TelescopePreviewTitle = {
					fg = colors.base,
					bg = colors.green,
					bold = true,
				},
				TelescopePromptTitle = {
					fg = colors.base,
					bg = colors.red,
					bold = true,
				},
				TelescopeSelection = { bg = colors.surface0, fg = colors.text },
				TelescopeResultsDiffAdd = { fg = colors.green },
				TelescopeResultsDiffChange = { fg = colors.yellow },
				TelescopeResultsDiffDelete = { fg = colors.red },
			}
		end,
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		which_key = true,
		barbecue = {
			dim_dirname = true,
			bold_basename = true,
			dim_context = false,
			alt_background = true,
		},
	},
}

return options

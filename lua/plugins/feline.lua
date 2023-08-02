local colors = require("catppuccin.palettes").get_palette()

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "surface0",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "text",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
		},
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
		},
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "sky",
		},
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative-short",
			},
		},
		hl = {
			fg = "text",
			bg = "mantle",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "peach",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "sky",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "green",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "text",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "text",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "blue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
}

local left = {
	c.vim_mode,
	c.fileinfo,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
}

local middle = {}

local right = {
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
	c.position,
	c.file_type,
	c.lsp_client_names,
	c.line_percentage,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

local theme = colors
theme["bg"] = colors.crust
theme["fg"] = colors.text

local vi_mode_colors = {
	NORMAL = "blue",
	["N-PENDING"] = "blue",
	OP = "green",
	INSERT = "green",
	TERMINAL = "green",
	SHELL = "green",
	VISUAL = "mauve",
	["V-LINE"] = "mauve",
	["V-BLOCK"] = "mauve",
	LINES = "mauve",
	BLOCK = "mauve",
	REPLACE = "maroon",
	["V-REPLACE"] = "maroon",
	SELECT = "maroon",
	["S-LINE"] = "maroon",
	["S-BLOCK"] = "maroon",
	COMMAND = "peach",
	PROMPT = "teal",
	MORE = "teal",
	CONFIRM = "sky",
}

local options = {
	components = components,
	theme = theme,
	vi_mode_colors = vi_mode_colors,
}

return options

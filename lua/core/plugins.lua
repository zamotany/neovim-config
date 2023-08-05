local plugins = {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = function()
			return require("plugins.auto-session")
		end,
	},

	-- UI and theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = function()
			return require("plugins.catppuccin")
		end,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = false,
		opts = function()
			return require("plugins.bufferline")
		end,
		config = function(_, opts)
			require("bufferline").setup(opts)
			require("mappings.bufferline")
		end,
	},
	{
		"freddiehaddad/feline.nvim",
		lazy = false,
		opts = function()
			return require("plugins.feline")
		end,
		config = function(_, opts)
			require("feline").setup(opts)
		end,
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			theme = "catppuccin",
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = function()
			return require("plugins.dressing")
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		ft = { "gitcommit", "diff" },
		init = function()
			-- load gitsigns only when a git file is opened
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
					if vim.v.shell_error == 0 then
						vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
						vim.schedule(function()
							require("lazy").load({ plugins = { "gitsigns.nvim" } })
						end)
					end
				end,
			})
		end,
		opts = function()
			return require("plugins.gitsigns")
		end,
		config = function(_, opts)
			require("gitsigns").setup(opts)
			require("mappings.gitsigns")
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewRefresh" },
		keys = { "<leader>" },
		opts = function()
			return require("plugins.diffview")
		end,
		config = function(_, opts)
			require("diffview").setup(opts)
			require("mappings.diffview")
		end,
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		opts = function()
			return require("plugins.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("plugins.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.lspconfig")
			require("mappings.lspconfig")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"folke/trouble.nvim",
		config = function(_, opts)
			require("trouble").setup(opts)
			require("mappings.trouble")
		end,
	},

	-- Code editing related plugins
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSInstallAll", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = function()
					return require("plugins.treesitter_context")
				end,
			},
		},
		opts = function()
			return require("plugins.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- Custom command to install all parser from ensure_installed
			vim.api.nvim_create_user_command("TSInstallAll", function()
				vim.cmd("TSInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.7",
		opts = function()
			return require("plugins.blankline")
		end,
		config = function(_, opts)
			require("indent_blankline").setup(opts)
			require("mappings.blankline")
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
			{ "<leader>/", mode = { "n", "v" }, desc = "Toggle comment" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
			require("mappings.comment")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("plugins.luasnip").setup(opts)
				end,
			},
			{
				-- autopairing of (){}[] etc
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
			{
				-- cmp sources plugins
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"onsails/lspkind.nvim",
			},
		},
		opts = function()
			return require("plugins.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		},
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
		-- TODO: hello world
		-- FIX: local
		-- PERF: asdf
		-- WARN: aaa
		-- HACK: local
		-- NOTE: TelescopePrompt
		config = function(_, opts)
			require("todo-comments").setup(opts)
			require("mappings.todo-comments")
		end,
	},

	-- File management & pickers
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		init = function()
			require("mappings.nvimtree")
		end,
		opts = function()
			return require("plugins.nvimtree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		cmd = "Telescope",
		keys = { "<leader>", "g" },
		opts = function()
			return require("plugins.telescope")
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			require("mappings.telescope")
			require("auto-session").setup_session_lens()

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	-- which-key - load after all GUI
	{
		"folke/which-key.nvim",
		keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
		config = function(_, opts)
			require("which-key").setup(opts)
		end,
	},
}

return plugins

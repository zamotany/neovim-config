local plugins = {
  -- UI and theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha"
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = {
      options = {
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    },
  },
  {
    "freddiehaddad/feline.nvim",
    lazy = false,
    config = function(_, opts)
      require("feline").setup(opts)
    end,
  },

  -- Code editing related plugins
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require("plugins.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    opts = function()
      return require("plugins.treesitter_context")
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
}

return plugins


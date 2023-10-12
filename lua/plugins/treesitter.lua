local options = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "scss",
    "jsdoc",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "yaml",
    "json",
    "diff",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>cn",
      node_incremental = "<leader>ci",
      scope_incremental = "<leader>cs",
      node_decremental = "<leader>cd",
    },
  },
}

return options

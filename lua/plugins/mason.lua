local options = {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "stylua",

    -- Frontend
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint-lsp",

    -- Backend
    "sqlls",
    "json-lsp",
    "yaml-language-server",

    -- Docker
    "dockerfile-language-server",
    "docker-compose-language-service",
  },
  PATH = "skip",
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
  max_concurrent_installers = 10,
}

return options

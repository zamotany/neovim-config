local lspconfig = require("lspconfig")
local utils = require("core.utils")

-- Configure diagnostic signs
local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "󰅙")
lspSymbol("Info", "󰋼")
lspSymbol("Hint", "󰌵")
lspSymbol("Warn", "")

vim.diagnostic.config({
  virtual_text = {
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Configure hover and signature help popups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = utils.border("FloatBorder"),
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = utils.border("FloatBorder"),
  focusable = false,
  relative = "cursor",
})

-- Borders for LspInfo winodw
local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "single"
  return opts
end

-- Customize on_attach
local make_on_attach = function(opts)
  return function(client, bufnr)
    if not opts.format then
      -- Disable LSP formatting in favour of null-ls formatting
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    -- Setup as-you-type signature popup
    require("lsp_signature").on_attach({
      floating_window_off_x = function()
        return -1
      end,
      hint_enable = false,
    }, bufnr)
  end
end

-- Customize capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Setup Lua LS
lspconfig.lua_ls.setup({
  on_attach = make_on_attach({ format = false }),
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

-- Setup rest of LS
local servers = {
  { "html", opts = { format = false } },
  { "cssls", opts = { format = false } },
  { "tsserver", opts = { format = false } },
  { "clangd", opts = { format = false } },
  { "eslint", opts = { format = false } },
  {
    "jsonls",
    opts = {
      format = false,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    },
  },
  {
    "yamlls",
    opts = {
      format = false,
      settings = {
        yaml = {
          schemaStore = {
            -- Disable built-in schemaStore support
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = "",
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    },
  },
  { "dockerls", opts = { format = true } },
  { "docker_compose_language_service", opts = { format = false } },
  { "sqlls", opts = { format = true } },
}

for _, lsp_config in ipairs(servers) do
  local lsp = lsp_config[1]
  local format = lsp_config.opts.format
  local settings = lsp_config.opts.settings

  lspconfig[lsp].setup({
    on_attach = make_on_attach({
      format = format,
    }),
    capabilities = capabilities,
    settings = settings,
  })
end

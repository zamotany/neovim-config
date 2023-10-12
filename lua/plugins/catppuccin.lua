local colors_utils = require("catppuccin.utils.colors")

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
        FoldColumn = { fg = colors.overlay1 },
        -- Code action customizations
        CodeActionBorder = { fg = colors.crust, bg = colors.crust },
        -- Cmp customizations
        CmpDocBorder = { link = "FloatBorder" },
        CmpDoc = { bg = colors.crust },
        CmpPmenu = { bg = colors.crust },
        CmpBorder = { link = "FloatBorder" },
        CmpSel = { link = "PmenuSel", bold = true },
        -- Diff customization
        DiffDelete = { fg = colors.surface2, bg = colors_utils.darken(colors.red, 0.18, colors.base) },
        -- Gitsigns customizations
        GitSignsBorder = { link = "FloatBorder" },
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.yellow },
        GitSignsDelete = { fg = colors.red },
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

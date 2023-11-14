-- Neovide specifics
vim.o.guifont = "JetBrainsMono_Nerd_Font:h13"
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_theme = "dark"

-- Configure teminal colors when inside Neovide
vim.g.terminal_color_0 = "#1e2132"
vim.g.terminal_color_1 = "#e27878"
vim.g.terminal_color_2 = "#b4be82"
vim.g.terminal_color_3 = "#e2a478"
vim.g.terminal_color_4 = "#84a0c6"
vim.g.terminal_color_5 = "#a093c7"
vim.g.terminal_color_6 = "#89b8c2"
vim.g.terminal_color_7 = "#c6c8d1"
vim.g.terminal_color_8 = "#6b7089"
vim.g.terminal_color_9 = "#e98989"
vim.g.terminal_color_10 = "#c0ca8e"
vim.g.terminal_color_11 = "#e9b189"
vim.g.terminal_color_12 = "#91acd1"
vim.g.terminal_color_13 = "#ada0d3"
vim.g.terminal_color_14 = "#95c4ce"
vim.g.terminal_color_15 = "#d2d4de"

-- Remap cmd shortcuts
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

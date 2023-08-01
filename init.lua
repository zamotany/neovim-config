local opt = vim.opt

-- Configure leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("core.bootstrap")

opt.hlsearch = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"
opt.termguicolors = true
opt.laststatus = 3
opt.showmode = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
opt.shortmess:append "sI"
opt.splitbelow = true
opt.splitright = true
opt.whichwrap:append "<>[]hl"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

require('lazy').setup(require("core.plugins"))
require("core.autocmds")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local map = vim.keymap.set

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false
opt.laststatus = 3
opt.cmdheight =1

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.wrap = false
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.updatetime = 250
opt.timeoutlen = 400

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 6
opt.sidescrolloff = 6

opt.completeopt = { "menu", "menuone", "noselect" }

opt.mouse = "a"

opt.clipboard = "unnamedplus"

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
-- number of spaces used for each step of (auto)indent
vim.opt.shiftwidth = 4
-- number of spaces a <Tab> in the text stands for
vim.opt.tabstop = 4
-- expand <Tab> to spaces in Insert mode
vim.opt.expandtab = true
-- Show hidden characters in Markdown and stuff
vim.opt.conceallevel = 2
-- Allows for the creation of project local .nvim files; basically using it for setting up tab spaces locally
vim.opt.exrc = true
-- Visual mode behaves as if there was a grid in the buffer
vim.opt.virtualedit = "block"

vim.o.winborder = "rounded"

vim.o.clipboard = "unnamedplus"

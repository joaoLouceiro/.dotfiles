-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("belazy_" .. name, { clear = true })
end

-- Kitty vars
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = augroup("KittySetVarVimEnter"),
  callback = function()
    io.stdout:write("\x1b]1337;SetUserVar=in_editor=MQo\007")
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  group = augroup("KittyUnsetVarVimLeave"),
  callback = function()
    io.stdout:write("\x1b]1337;SetUserVar=in_editor\007")
  end,
})

vim.api.nvim_create_autocmd({ "TermEnter" }, {
  callback = function()
    vim.fn.matchadd("ErrorMsg", [[\.\./[^:]\+:[0-9]\+:[0-9]\+]])
  end,
})

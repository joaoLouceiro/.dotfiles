-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })

local dap = require("dap")

-- Continue / Start
vim.keymap.set("n", "<F5>", dap.continue, {
  desc = "Debug: Start/Continue",
})

-- Step Over
vim.keymap.set("n", "<F10>", dap.step_over, {
  desc = "Debug: Step Over",
})

-- Step Into
vim.keymap.set("n", "<F11>", dap.step_into, {
  desc = "Debug: Step Into",
})

-- Step Out
vim.keymap.set("n", "<S-F11>", dap.step_out, {
  desc = "Debug: Step Out",
})

-- Toggle Breakpoint
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {
  desc = "Debug: Toggle Breakpoint",
})

-- Stop / Terminate
vim.keymap.set("n", "<S-F5>", dap.terminate, {
  desc = "Debug: Stop",
})

-- Restart
vim.keymap.set("n", "<C-S-F5>", dap.restart, {
  desc = "Debug: Restart",
})

-- Run to Cursor
vim.keymap.set("n", "<C-F10>", dap.run_to_cursor, {
  desc = "Debug: Run to Cursor",
})

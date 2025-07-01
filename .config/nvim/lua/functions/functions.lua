---@param mode string | table defaults to "n"
---@param lhs string
---@param rhs string
---@param opts table | nil default: { noremap = true, silent = true }
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    if type(mode) == "table" then
        for _, value in ipairs(mode) do
            vim.keymap.set(value, lhs, rhs, options)
        end
    else
        vim.keymap.set(mode, lhs, rhs, options)
    end
end

local function smart_bdelete()
  local cur_buf = vim.api.nvim_get_current_buf()
  local windows = vim.fn.win_findbuf(cur_buf)
  if #windows > 1 then
    -- Buffer is visible in more than one window, just delete
    vim.cmd('bdelete')
    return
  end
  -- Try to switch to an alternate buffer, or a new empty buffer
  local alt = vim.fn.bufnr('#')
  if alt > 0 and vim.fn.buflisted(alt) == 1 then
    vim.cmd('buffer #')
  else
    vim.cmd('enew')
  end
  vim.cmd('bdelete ' .. cur_buf)
end

-- Show help text in a floating window (hover)
local function help_hover()
  local word = vim.fn.expand("<cword>")
  print(word)
  local ok, help = pcall(vim.cmd("normal! K"))
  if not ok or not help or help == "" then
    vim.notify("No help found for: " .. word, vim.log.levels.INFO)
    return
  end
  local lines = vim.split(help, "\n")
  vim.lsp.util.open_floating_preview(lines, "help", { border = "rounded" })
end

return {
  smart_bdelete = smart_bdelete,
  help_hover = help_hover,
  map = map,
}

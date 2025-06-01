-- Call vim.keymap.set
-- @param t (table)
--  - t[1] *required*: lhs mapping 
--  - t[2] *required*: rhs mapping
--  - mode *optional*: defaults to 'n'
--  - opts *optional*: table with options
local function SetKeymap(t)
    if t[1] == nil or type(t[1]) ~= 'string' then
        error("No lhs")
    elseif t[2] == nil or type(t[2]) ~= 'string' then
        error("No rhs")
    end
    local options = { noremap = true, silent = true }
    if t.opts then
        options = vim.tbl_extend("force", options, t.opts)
    end
    vim.keymap.set(t.mode or 'n', t[1], t[2], options)
end

-- vim.g.mapleader = " "

SetKeymap({'<C-h>', '<C-w><C-h>'})
SetKeymap({'<C-j>', '<C-w><C-j>'})
SetKeymap({'<C-k>', '<C-w><C-k>'})
SetKeymap({'<C-l>', '<C-w><C-l>'})

SetKeymap({ '<C-_>', 'gcc', mode='n', opts = { remap = true }})
SetKeymap({ '<C-_>', 'gc', mode='v', opts = { remap = true }})

SetKeymap({ '<C-s>', '<cmd>w<cr>'})

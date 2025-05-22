function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

Map('n', '<C-h>', '<C-w><C-h>')
Map('n', '<C-j>', '<C-w><C-j>')
Map('n', '<C-k>', '<C-w><C-k>')
Map('n', '<C-l>', '<C-w><C-l>')


-- vim.keymap.set('i', '<C-_>', '<Esc>:Commentary<CR>')
-- vim.keymap.set('n', '<C-_>', 'gcc', { remap = true })
-- vim.keymap.set('v', '<C-_>', 'gc',  { remap = true })

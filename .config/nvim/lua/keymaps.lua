local map = require("functions/functions").map

map("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })

map("t", "<ESC>", "<C-\\><C-n>")


-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap = false })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap = false })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = false })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = false })
map({"i", "t"}, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window"})
map({"i", "t"}, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window", noremap = false })
map({"i", "t"}, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window", noremap = false })
map({"i", "t"}, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window", noremap = false })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<cmd>KittyNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<cmd>KittyNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<cmd>KittyNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<cmd>KittyNavigateRight<cr>", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Comments - some shells interpret <C-/> as <C-_>
map('n',  '<C-/>', 'gcc', { remap = true, desc = "Toggle Comment" })
map('n',  '<C-_>', 'gcc', { remap = true, desc = "Toggle Comment" })
map('v',  '<C-/>', 'gc', { remap = true, desc = "Toggle Comment" })
map('v',  '<C-_>', 'gc', { remap = true, desc = "Toggle Comment" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", require('functions/functions').smart_bdelete, { desc = "Delete Buffer (keep split)" })



-- Clear search
-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Hover Keyword" })

-- better indenting
map("v", "<", "<gv", {desc = "Ident Left"})
map("v", ">", ">gv", {desc = "Ident Right"})

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Help hover in floating window
-- map("n", "<leader>H", require('functions.smart_bdelete').help_hover, { desc = "Show help in hover window" })

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" })

local map = require("functions/functions").map

map("n", "<leader>dm", "<cmd>lua require('dap-python').test_method()<CR>", {desc = "DAP (Python): Test Method", buffer = true })
map("n", "<leader>dc", "<cmd>lua require('dap-python').test_class()<CR>", {desc = "Python: Test Class", buffer = true })
map("n", "<leader>ds", "<cmd>lua require('dap-python').debu_selection()<CR>", {desc = "DAP (Python): Debug Selection", buffer = true })

local dap = require("dap")
dap.set_log_level('DEBUG')

return {
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
           -- require("mason-nvim-dap").setup({
           --     ensure_installed = { "python" }
           -- })
        end,
        keys = {
        }
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
           -- require("mason-nvim-dap").setup({
           --     ensure_installed = { "python" }
           -- })
        end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mason-org/mason.nvim",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        lazy = false,
        config = function ()
            require("dapui").setup()

            local dap_python = require("dap-python")
            dap_python.setup("~/.virtualenvs/debugpy/bin/python")
            dap_python.test_runner = "pytest"
        end,
        keys = {
            {"<F5>", dap.continue, desc = "DAP: Continue" },
            {"<C-F5>", dap.close, desc = "DAP: Close" },
            {"<F29>", dap.close, desc = "DAP: Close" },
            {"<F1>", dap.step_over, desc = "DAP: Step Over" },
            {"<F2>", dap.step_into, desc = "DAP: Step Into" },
            {"<F3>", dap.step_out, desc = "DAP: Step Out" },
            {"<F4>", dap.step_back, desc = "DAP: Step Back" },
            {"<F6>", dap.restart, desc = "DAP: Restart" },
            {"<space>db", dap.toggle_breakpoint, desc = "DAP: Toggle Breakpoint" },
            {"<space>dg", dap.run_to_cursor, desc = "DAP: Go to Cursor" },


            {"<leader>dm", "<cmd>lua require('dap-python').test_method()<CR>", desc = "DAP (Python): Test Method"},
            {"<leader>dc", "<cmd>lua require('dap-python').test_class()<CR>", desc = "Python: Test Class"},
            {"<leader>ds", "<cmd>lua require('dap-python').debu_selection()<CR>", desc = "DAP (Python): Debug Selection"},
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function ()
            local ui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
                vim.cmd("Neotree close")
            end
            dap.listeners.before.launch.dapui_config = function()
                vim.cmd("Neotree close")
                ui.open()
            end
            -- vim.keymap.set("n", "K", function()
            --     -- local dap_ok, dap = pcall(require, "dap")
            --     -- local dapui_ok, dapui = pcall(require, "dapui")
            --     if dap.session() then
            --         ui.eval(nil, { enter = true })
            --     else
            --         vim.cmd("normal! K")
            --     end
            -- end, { desc = "Contextual Hover/Eval" })
            -- dap.listeners.before.event_terminated.dapui_config = function()
            --     ui.close()
            -- end
            -- dap.listeners.before.event_exited.dapui_config = function()
            --     ui.close()
            -- end
        end,
        keys = {
            { "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "DAP: Toggle UI"  },
            { "K", function ()
                if dap.session() then
                    require("dapui").eval(nil, { enter = true , border = "solid" })
                else
                    vim.lsp.buf.hover({ border = "solid", enter = true })
                end
            end, desc = "DAP: Toggle UI"  },
        }
    }
}

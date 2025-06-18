local ui_state = { open=false }
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mason-org/mason.nvim",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            "jbyuki/one-small-step-for-vimkind"
        },
        lazy = false,
        config = function()

            local dap = require"dap"
            local ui = require("dapui")
            require("dap-python").setup("python")

            dap.set_log_level('DEBUG')
            require("dapui").setup()

            dap.configurations.lua = {
              {
                type = 'nlua',
                request = 'attach',
                name = "Attach to running Neovim instance",
              }
            }

            dap.adapters.nlua = function(callback, config)
              callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
            end

            -- vim.keymap.set('n', '<leader>db', require"dap".toggle_breakpoint, { noremap = true })
            -- vim.keymap.set('n', '<leader>dc', require"dap".continue, { noremap = true })
            -- vim.keymap.set('n', '<leader>do', require"dap".step_over, { noremap = true })
            -- vim.keymap.set('n', '<leader>di', require"dap".step_into, { noremap = true })

            vim.keymap.set('n', '<leader>dl', function()
              require("osv").launch({port = 8086})
            end, { noremap = true })

            vim.keymap.set('n', '<leader>dw', function()
              local widgets = require("dap.ui.widgets")
              widgets.hover()
            end)

            vim.keymap.set('n', '<leader>df', function()
              local widgets = require("dap.ui.widgets")
              widgets.centered_float(widgets.frames)
            end)

            vim.keymap.set("n", "<leader>du", function()
                if ui_state.open then
                    require("dapui").close()
                else
                    require("dapui").open()
                end
            end)

            vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F29>", dap.close)
            vim.keymap.set("n", "<F1>", dap.step_over)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_out)
            vim.keymap.set("n", "<F4>", dap.step_back)
            vim.keymap.set("n", "<F6>", dap.restart)


            dap.listeners.before.attach.dapui_config = function()
                ui.open()
                vim.cmd("Neotree close")
                ui_state.open = true
            end
            dap.listeners.before.launch.dapui_config = function()
                vim.cmd("Neotree close")
                ui.open()
                ui_state.open = true
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
                ui_state.open = false
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
                ui_state.open = false
            end
        end
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
}

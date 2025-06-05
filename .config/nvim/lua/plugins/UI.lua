return {
    {
        "rebelot/kanagawa.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                transparent = false
            })
            vim.cmd.colorscheme("kanagawa")
        end
    },{
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                transparent_background_level=0,
                background = "medium",
                italics = true
            })
            vim.cmd.colorscheme("everforest")
        end,
        keys = {
            { "<leader>co",
            function()
                local everforest = require('everforest')
                local current_transparency = everforest.config.transparent_background_level
                local new_transparency = 0
                if current_transparency == 0 then
                    new_transparency = 1
                else
                    new_transparency = 0
                end
                everforest.config.transparent_background_level = new_transparency
                everforest.load()
                vim.cmd.colorscheme('everforest')
            end,
            desc = "Toggle opacity" },
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { }
    },
}

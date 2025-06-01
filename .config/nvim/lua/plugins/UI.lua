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
                vim.cmd.colorscheme("everforest")
            })
        end,
    }, {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { }
    },
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                -- transparent = true
            })
            vim.cmd.colorscheme("kanagawa")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({})
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "python" },
                highlight = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
                        node_incremental = "<Leader>se",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            -- Para aceder aos capture groups do ficheiro atual, `TSEditQuery textobjects` 
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            -- You can optionally set descriptions to the mappings (used in the desc parameter of
                            -- nvim_buf_set_keymap) which plugins like which-key display
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                        },
                        include_surrounding_whitespace = false,
                    },
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    -- LSP config
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason.nvim"},
        config = function()
            require("mason-lspconfig").setup({})
        end
    },

    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        -- Substitui a func config e o require('module').setup()
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'enter' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = true } },

            -- A propriedade sources indica ao blink de onde vêm as opções para o auto-complete.
            -- É uma ponte entre alguns dados e o sistema de complete.
            -- "lsp" pede dados ao servidor LSP.
            -- "path" completa o caminho para os diretórios, assim que começo a escrever "/"
            -- "buffer" procura palavras no ficheiro aberto.
            -- "snippets" blocos de código. Eles vêm quer do LSP, quer do plugin em dependência, "friendly-snippets".
            --      Podemos ver 
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },


})

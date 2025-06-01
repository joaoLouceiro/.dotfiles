return {
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason.nvim"},
        opts = {}
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
    }
}

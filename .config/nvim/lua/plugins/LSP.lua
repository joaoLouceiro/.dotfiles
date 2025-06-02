return {
    {
        "neovim/nvim-lspconfig",
        config = function ()
            -- local lspconfig = require('lspconfig')
            --
            -- lspconfig.lua_ls.setup {
            --     settings = {
            --         Lua = {
            --             diagnostics = {
            --                 globals = { 'vim' }
            --             }
            --         }
            --     }
            -- }
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
        opts = {
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
    {
        "fladson/vim-kitty",
        ft = "kitty"
    }
}

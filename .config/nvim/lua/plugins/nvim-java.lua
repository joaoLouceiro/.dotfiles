return {
  "nvim-java/nvim-java",
  config = function()
    require("java").setup({
      jdtls = {
        settings = {
          java = {
            maven = {
              downloadSources = true,
            },
            eclipse = {
              downloadSources = true,
            },
            gradle = {
              downloadSources = true,
            },
          },
        },
      },
      jdk = {
        auto_install = false,
      },
    })
    vim.lsp.enable("jdtls")
  end,
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function(_, opts)
          -- Disable inlay hints specifically for JDTLS
          opts.settings = opts.settings or {}
          opts.settings.java = opts.settings.java or {}
          opts.settings.java.inlayHints = {
            parameterNames = { enabled = "none" },
          }
        end,
      },
    },
  },
}

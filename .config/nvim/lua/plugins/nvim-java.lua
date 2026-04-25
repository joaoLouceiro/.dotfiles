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
          },
        },
      },
      jdk = {
        auto_install = false,
      },
    })
    vim.lsp.enable("jdtls")
  end,
}

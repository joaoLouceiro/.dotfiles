return {
  {
    "joaoLouceiro/hubbamax.nvim",
    enabled = false,
    lazy = true,
    priority = 1,
    config = function()
      require("hubbamax").setup({
        transparent_background = false,
      })
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_float_style = "blend"
      vim.g.everforest_disable_terminal_colors = true
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "everforest",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "everforest" },
  },
}

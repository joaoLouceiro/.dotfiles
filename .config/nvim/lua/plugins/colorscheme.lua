return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      --transparent_mode = true,
    },
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "solarized-osaka",
      -- colorscheme = "catppuccin-frappe",
    },
  },
}

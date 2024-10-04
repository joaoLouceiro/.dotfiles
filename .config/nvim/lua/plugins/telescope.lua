return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
      },
    })
  end,
}

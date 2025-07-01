function _G.LazyHelp()
    vim.system({'xdg-open', 'https://lazy.folke.io/'})
end

vim.cmd([[command! LazyHelp lua _G.LazyHelp()]])


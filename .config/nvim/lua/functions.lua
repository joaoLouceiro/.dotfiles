function _G.LazyHelp()
    vim.system({'xdg-open', 'https://lazy.folke.io/'})
end

vim.cmd([[command! LazyHelp lua _G.LazyHelp()]])

function _G.Terminal()
    vim.cmd("botright new | resize 10 | term")
end

vim.cmd([[command! Term lua _G.Terminal()]])


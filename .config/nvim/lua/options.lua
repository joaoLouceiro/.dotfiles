vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.splitbelow = true -- novas janelas abertas na parte inferior da tabela
vim.opt.splitright = true -- novas janelas abertas na parte direita da tabela

vim.opt.wrap = false

vim.opt.expandtab = true -- tabs podem ter um comportamento imprevisivel
-- esta nao é a config recomendada pelo man do vim para gerir tabs
-- :h tabstop
vim.opt.tabstop = 4 -- indica ao vim quantos espaços são um <TAB> QUANDO GUARDA ou ABRE um ficheiro
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus" -- usa o clipboard do registo +

vim.opt.scrolloff = 999 -- impede que o cursor "navegue" na janela em docs grandes, bloqueando-o no centro do ecra

vim.opt.virtualedit = "block" -- permite que o visual block passe para além do final da linha selecionada

vim.opt.inccommand = "split" -- mostra os resultados de uma subtstituição numa janela à parte

-- Comandos nativos são sempre em letra minúscula.
-- Comandos de plugins são sempre em letra maiúscula.
-- Este comando permite ignorar o case quando dou <TAB> num comando
vim.opt.ignorecase = true -- ignore case quando procuro um comando

vim.opt.termguicolors = true -- permite mais cores, diferentes regras de highlight, etc

vim.g.mapleader = " "

-- Set up diagnostics
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

vim.opt.wrap = true

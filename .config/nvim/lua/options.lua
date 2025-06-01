local opt = vim.opt

vim.g.mapleader = " "

opt.number = true
opt.relativenumber = true

opt.splitbelow = true -- novas janelas abertas na parte inferior da tabela
opt.splitright = true -- novas janelas abertas na parte direita da tabela

opt.wrap = false

opt.expandtab = true -- tabs podem ter um comportamento imprevisivel
-- esta nao é a config recomendada pelo man do vim para gerir tabs
-- :h tabstop
opt.tabstop = 4 -- indica ao vim quantos espaços são um <TAB> QUANDO GUARDA ou ABRE um ficheiro
opt.shiftwidth = 4

opt.clipboard = "unnamedplus" -- usa o clipboard do registo +

opt.scrolloff = 9 -- impede que o cursor "navegue" na janela em docs grandes, bloqueando-o no centro do ecra
opt.sidescrolloff = 8 -- colunas de contexto

opt.virtualedit = "block" -- permite que o visual block passe para além do final da linha selecionada

opt.inccommand = "nosplit" -- mostra os resultados de uma subtstituição numa janela à parte

-- Comandos nativos são sempre em letra minúscula.
-- Comandos de plugins são sempre em letra maiúscula.
-- Este comando permite ignorar o case quando dou <TAB> num comando
opt.ignorecase = true -- ignore case quando procuro um comando

opt.termguicolors = true -- permite mais cores, diferentes regras de highlight, etc

-- Set up diagnostics
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.linebreak = true
opt.list = true
opt.showmode = false
opt.spelllang = { "en", "pt" }
opt.mouse = "a"


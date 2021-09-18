local vimp = require("vimp")

-- Leader key
vim.g.mapleader = " "

-- Save with Ctrl + S
vimp.nnoremap("<C-s>", ":w<CR>")


-- Window Movement
vimp.nmap("<C-Left>", "<C-w>h")
vimp.nmap("<C-Right>", "<C-w>l")
vimp.nmap("<C-Up>", "<C-w>k")
vimp.nmap("<C-Down>", "<C-w>j")

-- Better identation
vimp.vnoremap(">", ">gv")
vimp.vnoremap("<", "<gv")
vimp.nmap(">", ">>")
vimp.nmap("<", "<<")

-- Line / Block movement
vimp.xnoremap("<S-Down>" ,":m '>+1<CR>gv=gv")
vimp.xnoremap("<S-Up>" ,":m '<-2<CR>gv=gv")


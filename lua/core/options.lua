vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local o = vim.opt

o.backspace = '2'
o.showcmd = true
o.laststatus = 2
o.autowrite = true
o.cursorline = true
o.autoread = true

-- use spaces for tabs and whatnot
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.expandtab = true

--Line numbers
o.number = true
o.relativenumber = true
o.cmdheight = 0
o.mouse = nil
o.clipboard = "unnamedplus"

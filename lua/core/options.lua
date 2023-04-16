local fn = vim.fn
local o = vim.opt

o.completeopt = { "menu", "menuone", "noselect", "noinsert" }

o.number = true
o.relativenumber = true
-- tabs & indentation
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.autoindent = true

o.wrap = true
o.breakindent = true
o.showbreak = string.rep(" ", 3)
o.linebreak = true

o.smartcase = true
o.smartindent = true
o.swapfile = false
o.termguicolors = true
o.background = "dark"
o.cursorline = true
o.undofile = false
o.wildignorecase = true
o.wildmode = "full"
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.updatetime = 300
o.timeoutlen = 500
o.showtabline = 2
o.scrolloff = 999
o.sidescrolloff = 8
o.lazyredraw = true
o.laststatus = 2
o.ruler = true
o.wildmenu = true
o.title = true
o.spell = true
o.autoread = true
o.mouse = nil
vim.scriptencoding = 'utf-8'
o.fileencoding = 'utf-8'
o.encoding = 'utf-8'
--o.clipboard = "unnamedplus"
o.splitright = true 
o.splitbelow = true 
o.clipboard:prepend { 'unnamed', 'unnamedplus' }
o.cmdheight = 1
o.backspace = "indent,eol,start"

--vim.g.mapleader = " "
--vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- disable auto comment when insert new line after comment
vim.api.nvim_create_autocmd("bufEnter", {
  group = vim.api.nvim_create_augroup("FormatOptions", {}),
  pattern = "*",
  callback = function()
    o.formatoptions:remove { "r", "o" }
  end,
})

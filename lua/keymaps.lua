local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
-- Set space as my leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Quit neovim
map("n", "<leader>Q", ":qa<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Quick write
map("n", "<leader>w", ":w<CR>", opts)

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Split
map("n", "sh", ":split<Return><C-w>w", { noremap = true, silent = false })
map("n", "sv", ":vsplit<Return><C-w>w", { noremap = true, silent = false })

-- Indent while in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up/down while in visual block
map("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = false })
map("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = false })


-- leader key is <Space>, defined in init.lua
local keymap = vim.keymap.set

keymap("n", "q", "")
keymap({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete without yank" })

-- Scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Split
keymap("n", "sh", ":split<Return><C-w>w", { noremap = true, silent = false })
keymap("n", "sv", ":vsplit<Return><C-w>w", { noremap = true, silent = false })

-- Move text up/down while in visual block
keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = false })
keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = false })

-- Indent while in visual mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("v", "<leader>nr", "<Plug>RestNvim", { noremap = true, silent = false })

keymap("n", "<Tab>", ":tabn<CR>", { noremap = true, silent = false })
keymap("n", "<S-Tab>", ":tabp<CR>", { noremap = true, silent = false })

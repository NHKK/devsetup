local keymap = vim.keymap.set

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

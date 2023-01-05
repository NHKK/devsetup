vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, 'y', '"*y :let @+=@*<CR>', { noremap = true, silent = true })

-- Windows
-- Navigation
vim.keymap.set('n', '<C-h>', "<C-w>h", { noremap = true, silent = false })
vim.keymap.set('n', '<C-k>', "<C-w>k", { noremap = true, silent = false })
vim.keymap.set('n', '<C-j>', "<C-w>j", { noremap = true, silent = false })
vim.keymap.set('n', '<C-l>', "<C-w>l", { noremap = true, silent = false })
-- Split
vim.keymap.set('n', 'sh', ":split<Return><C-w>w", { noremap = true, silent = false })
vim.keymap.set('n', 'sv', ":vsplit<Return><C-w>w", { noremap = true, silent = false })

-- Move text up/down while in visual block
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { noremap = true, silent = false })
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { noremap = true, silent = false })

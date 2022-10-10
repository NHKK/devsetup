local opts = { noremap = true, silent = true }

-- Shorten function name
--local keymap = vim.api.nvim_set_keymap
local keymap = function(mode, key, cmd, opts)
  vim.api.nvim_set_keymap(mode, key, cmd, opts or { noremap = true, silent = true })
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal(n) --
-- Better window navigation
keymap("n", "<BS>", "<C-w>h", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split windows
keymap("n", "sh", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", { noremap = true})

-- Visual(v) --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block(x) --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",opts)
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- cokeline
keymap("n", "<Tab>", "<Plug>(cokeline-focus-next)", opts)
keymap("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", opts)
keymap("n", "<C-w>", "<Plug>(cokeline-pick-close)", opts)

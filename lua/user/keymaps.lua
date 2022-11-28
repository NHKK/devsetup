local opts = { noremap = true, silent = false }

-- Shorten function name
--local keymap = vim.api.nvim_set_keymap
local keymap = function(mode, key, cmd, opts)
  vim.api.nvim_set_keymap(mode, key, cmd, opts or { noremap = true, silent = false })
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
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Visual(v) --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block(x) --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", ";f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",opts)
keymap("n", ";w", "<cmd>Telescope live_grep<cr>", opts)

-- File Explorer
keymap("n", "<leader>e", ":Neotree<CR>", opts)

-- Symbol outline
keymap("n", "<leader>p", ":SymbolsOutline<CR>", opts)
--keymap("n", "<C-p>", "<Plug>(fern-action-preview:auto:toggle)", opts)

-- Tab
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("n", "<C-w>", ":tabclose<CR>", opts)
keymap("n", "<Tab>", ":tabn<CR>", opts)
keymap("n", "<S-Tab>", ":tabp<CR>", opts)

keymap("n", "<C-F>", ":LspZeroFormat<CR>", opts)

-- Trouble Toggle
keymap("n", "<leader>xx", ":TroubleToggle<CR>", opts)


-- Vimspector
--keymap("n", "<leader>dd", ":call vimspector#Launch()", { noremap = true })
--keymap("n", "<F5>", ":call vimspector#Continue()", { noremap = true })
--keymap("n", "<F2>", ":call vimspector#ToggleBreakpoint()", { noremap = true })
-- keymap("n", "<F5>", "<Plug>VimspectorContinue", { noremap = true })
-- keymap("n", "<F2>", "<Plug>VimspectorToggleBreakpoint", { noremap = true })
-- keymap("n", "<F3>", "<Plug>VimspectorStop", { noremap = true })
-- keymap("n", "<F4>", "<Plug>VimspectorRestart", { noremap = true })




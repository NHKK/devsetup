local options = {
    backup = false,
    writebackup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = {"menuone", "noselect"},
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    pumheight = 10,
    showmode = true,
    showcmd = true,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 300,
    undofile = true,
    updatetime = 300,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 999,
    sidescrolloff = 8,
    guifont = "hack:h17",
    mouse = "c",

    -- Plugins
    completeopt = { 'menuone', 'noselect', 'noinsert'},
}
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

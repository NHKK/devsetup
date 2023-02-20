local keymap = vim.keymap.set

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")


-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")


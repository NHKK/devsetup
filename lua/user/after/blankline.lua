local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then return end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

blankline.setup {
  enabled = true,
  colored_indent_levels = true,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

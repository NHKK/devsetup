require('lsp-setup').setup({
  servers = {
    pylsp = {},
    tsserver = {}
  }
})

-- Hide dumb inline hint text
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = true }
})

--working formatting based on lsp
vim.lsp.buf.format { async = true }

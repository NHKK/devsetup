require('lsp-setup').setup({
  servers = {
    pylsp = {},
    tsserver = {}
  }
})

-- Hide dumb inline hint text
vim.diagnostic.config({
  virtual_text = false
})


vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nill, {focus=false})]]

--working formatting based on lsp
--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]


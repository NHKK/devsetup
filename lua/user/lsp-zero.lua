local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then 
  print ('lsp not working; in zero file')
  return
end

lsp_zero.preset('recommended')
lsp_zero.setup()

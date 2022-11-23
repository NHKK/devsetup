local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  print ('lsp not working; in zero file')
  return
end

lsp_zero.preset('recommended')
lsp_zero.setup()

lsp_zero.configure('sql', {
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5432 user=root password=root dbname=postgres sslmode=disable',
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end,
})


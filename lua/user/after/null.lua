local is_present, null_ls = pcall(require, "null_ls")

if not is_present then return end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
  }
}

local pretty_present, pretty = pcall(require, "prettier")

if (not pretty_present) then return end

pretty.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  }
}
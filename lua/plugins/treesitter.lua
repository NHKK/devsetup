return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "help",
          "javascript",
          "lua",
          "typescript",
        },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = false },
        context_commentstring = { enable = true, enable_autocmd = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-bs>",
          },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        textobjects = {
          select = {
            enable = false,
          },
          move = {
            enable = false,
          },
          lsp_interop = {
            enable = false,
          },
        },
      })
    end,
  },
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { "TSUpdateSync" },
    keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'lua',
      },
      auto_install = true,
      sync_install = true,
      highlight = { enable = true, disable = { "css", "astro" } },
      indent = { enable = true, disable = {"python"} },
      autopairs = { enable = true },
      ignore_install = { '' },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      matchup = { enable = true, include_match_words = true, enable_quotes = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- nvim-treesitter-context
  --[[
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
  },
  --]]

  -- vim-matchup
  { 'andymass/vim-matchup', dependencies = 'nvim-treesitter/nvim-treesitter', event = { 'BufReadPost', 'BufNewFile' },
    enable = false
  },

  -- rainbow-delimiters.nvim
  {
    'hiphish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    enable = false
  },
}

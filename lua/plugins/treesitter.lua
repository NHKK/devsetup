return {
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      event = { 'BufReadPost', 'BufNewFile' },
      opts = {
        ensure_installed = {
          'lua',
        },
        highlight = { enable = true },
        indent = { enable = true },
        ignore_install = { '' },
        auto_install = true,
        matchup = { enable = true, include_match_words = true, enable_quotes = true },
      },
      config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
      end,
    },
  
    -- nvim-treesitter-context
    {
      'nvim-treesitter/nvim-treesitter-context',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      event = { 'BufReadPost', 'BufNewFile' },
      config = true,
    },
  
    -- vim-matchup
    { 'andymass/vim-matchup', dependencies = 'nvim-treesitter/nvim-treesitter', event = { 'BufReadPost', 'BufNewFile' } },
  
    -- indent-blankline.nvim
    {
      'lukas-reineke/indent-blankline.nvim',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      event = { 'BufReadPost', 'BufNewFile' },
      opts = {
        char = '▏',
        context_char = '▏',
        use_treesitter = true,
        show_first_indent_level = true,
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
        filetype_exclude = {
          'help',
          'dashboard',
          'Trouble',
          'neogitstatus',
          'mason',
          'toggleterm',
          'lazy',
          'neo-tree',
        },
      },
    },
  
    -- rainbow-delimiters.nvim
    {
      'hiphish/rainbow-delimiters.nvim',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      event = { 'BufReadPost', 'BufNewFile' },
    },
  }
  
  
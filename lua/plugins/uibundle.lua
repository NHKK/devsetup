return {
    -- colorscheme
    {
      'nanotech/jellybeans.vim',
      lazy = false,
      priority = 1000,
      opts = {
        transparent = true,
        lualine_bold = true,
        terminal_colors = true,
        on_highlights = function(hl, c)
          local prompt = '#2d3149'
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      },
      config = function()
          vim.cmd("colorscheme jellybeans")
      end
    },
  
    -- lualine.nvim
    {
      'nvim-lualine/lualine.nvim',
      dependencies = 'nvim-tree/nvim-web-devicons',
      event = { 'BufReadPost', 'BufNewFile' },
      opts = {
        options = {
          theme = 'jellybeans',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            'NeogitStatus',
            'NeogitCommitView',
            'NeogitPopup',
            'NeogitConsole',
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              sources = { 'nvim_lsp', 'nvim_diagnostic' },
            },
            function()
              local ok, m = pcall(require, 'better_escape')
              return ok and m.waiting and '✺' or ''
            end,
          },
          lualine_c = { 'filename' },
          lualine_x = { 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        extensions = {
          'neo-tree',
          'symbols-outline',
          'trouble',
          'lazy',
        },
      },
    },
  }
  
  
return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      options = {
        theme = 'auto',
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
        lualine_c = {
          { 'filename' }
        },
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
  }


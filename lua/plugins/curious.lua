return {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    enabled = true, 
    config = function()
      vim.g.startuptime_tries = 10
    end,
  }

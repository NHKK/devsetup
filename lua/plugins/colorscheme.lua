return {
  {
		"embark-theme/vim",
		as = 'embark',
    lazy = false,
    priority = 1000,
    config = function()
			vim.cmd('colorscheme embark')
    end,
  },
}

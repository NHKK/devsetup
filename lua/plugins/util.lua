return {
  -- lua library for neovim
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  -- auto detect indent
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup()
    end
  },
  {
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		opts = true,
	},
}

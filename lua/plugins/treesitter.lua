return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	enabled = true,
	version = false,
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = 1500,
		},
		disable = { "latex" },
	},
}

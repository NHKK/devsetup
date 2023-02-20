return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	enabled = true,
	version = false,
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		sync_install = false,
		highlight = {
			enable = false,
			use_languagetree = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = 1500,
		},
		disable = { "latex" },
		ensure_installed = {"javascript", "typescript", "lua"},
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end
	},
}

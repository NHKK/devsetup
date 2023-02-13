return {
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	enabled = false,
	-- 	opts = {
	-- 		char = "│",
	-- 		filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
	-- 		show_trailing_blankline_indent = false,
	-- 		show_current_context = false,
	-- 	},
	-- },

	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},

	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup({})
		end,
	},

	{
		"echasnovski/mini.tabline",
		config = function()
			require("mini.tabline").setup({})
		end,
	},

	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup({
				mappings = {
					comment = "gc",
				},
			})
		end,
	},

	{
		"echasnovski/mini.statusline",
		config = function()
			require("mini.statusline").setup({})
		end,
	},

	{
		"echasnovski/mini.base16",
		config = function()
			require("mini.base16").setup({
				palette = {
					base00 = "#100E23",
					base01 = "#1E1C31",
					base02 = "#2D2B40",
					base03 = "#3E3859",
					base04 = "#8A889D",
					base05 = "#CBE3E7",
					base06 = "#CBE3E7",
					base07 = "#f3f4f5",
					base08 = "#F02E6E",
					base09 = "#F2B482",
					base0A = "#FFE6B3",
					base0B = "#62D196",
					base0C = "#91DDFF",
					base0D = "#65B2FF",
					base0E = "#D4BFFF",
					base0F = "#87DFEB",
				},
			})
		end,
	},
}

return {
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup({})
		end,
		lazy = false,
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
		lazy = false,
		config = function()
			require("mini.statusline").setup({})
		end,
	},
	{
		"echasnovski/mini.base16",
		lazy = false,
		config = function()
			require("mini.base16").setup({
				-- DUO Tone Dark
				palette = {
					base00 = "#100E23",
					base01 = "#1E1C31",
					base02 = "#2D2B40",
					base03 = "#3E3859",
					base04 = "#837bad",
					base05 = "#9b87fd",
					base06 = "#b3a5fe",
					base07 = "#eeebff",
					base08 = "#7765d2",
					base09 = "#dc9147",
					base0A = "#e59e57",
					base0B = "#7c756e",
					base0C = "#fec286",
					base0D = "#ecab69",
					base0E = "#a49bcf",
					base0F = "#8e81cf",
				},
				--[[
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
				--]]
			})
		end,
	},
}

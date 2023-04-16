return {
	{
		"echasnovski/mini.statusline",
		lazy = false,
		config = function()
			require("mini.statusline").setup({})
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
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup({})
		end,
		lazy = false,
	},
	{
		"echasnovski/mini.completion",
		config = function()
			require("mini.completion").setup({})
		end,
		enabled = false,
	},
	{
		"echasnovski/mini.tabline",
		config = function()
			require("mini.tabline").setup({})
		end,
	},
	{
		"echasnovski/mini.jump2d",
		config = function()
			require("mini.jump2d").setup({
				mappings = {
					start_jumping = "S"
				}
			})
		end,
	}
}

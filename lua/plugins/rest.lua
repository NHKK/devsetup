
return {
	"rest-nvim/rest.nvim",
	lazy = false,
	config = function()
		require("rest-nvim").setup({})
	end,
	keys = {
		{ "<leader>nr", "<Plug>RestNvim" },
	},
}

return {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"nvim-tree/nvim-web-devicons",
		opts = { default = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		opts = true,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		opts = true,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		opts = {
			integrations = { diffview = true },
		},
		keys = {
			{ "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
		},
	},
}

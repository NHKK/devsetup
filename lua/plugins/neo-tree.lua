local M = {
  "nvim-neo-tree/neo-tree.nvim",
	dependencies = {
	 "nvim-tree/nvim-web-devicons",
	 "MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
}

function M.config()
	local neotree = require("neo-tree")
	neotree.setup({
		window = {
			position = "right"
		}
	})
end

return M

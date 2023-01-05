local M = {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	config = {
      auto_open = false,
     use_diagnostic_signs = true,
  },
	keys = { "<leader>x" },
}

function M.config()
	require("trouble").setup()
	vim.keymap.set('n', '<leader>xx', "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
end

return M

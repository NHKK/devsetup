-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, {})
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})

			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			require("lspconfig").tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"stylua",
			},
		},
		config = function(opts)
			require("mason").setup(opts)
		end,
	},
}

local M = {
	'VonHeikemen/lsp-zero.nvim',
	lazy = false,
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'lukas-reineke/lsp-format.nvim', config = true },
		{ 'ray-x/lsp_signature.nvim' },

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-nvim-lua' },

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
	}
}

function M.config()
	local zero = require('lsp-zero')
	zero.preset('recommended')
	zero.on_attach(function(client, bufnr)
		require('lsp-format').on_attach(client, bufnr)
		require('lsp_signature').on_attach({
			bind = true,
			handler_opts = { border = "rounded" }
		}, bufnr)
	end)
	zero.setup()
	vim.diagnostic.config { virtual_text = false, virtual_lines = true }
end

return M

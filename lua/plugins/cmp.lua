return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
			"hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
    },
    config = function()
			local cmp = require'cmp'
			cmp.setup {
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'buffer' }
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
			}
    end,
}

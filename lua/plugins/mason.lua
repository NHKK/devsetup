return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		opts = function()
			local servers = {}
			for _, value in pairs(require("user.constants").lsp_to_mason) do
				table.insert(servers, value.lsp)
			end

			return {
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = { spacing = 4, prefix = "●" },
					severity_sort = true,
				},
				autoformat = false,
				format = {
					formatting_options = nil,
					timeout_ms = nil,
				},
				servers = servers,
			}
		end,

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local handlers = require("user.servers.lsp.handlers")
			local signs = require("user.constants").diagnostic_signs

			for name, icon in pairs(signs) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			vim.diagnostic.config(opts.diagnostics)

			require("mason-lspconfig").setup({
				ensure_installed = opts.servers,
			})

			local xopts = {}
			for _, server in pairs(opts.servers) do
				xopts = {
					on_attach = handlers.on_attach,
					capabilities = handlers.capabilities,
					keymaps = handlers.lsp_keymaps,
				}
				server = vim.split(server, "@")[1]
				local ok, copts = pcall(require, "user.servers.lsp.servers" .. server)
				if ok then
					xopts = vim.tbl_deep_extend("force", copts, xopts)
				end
				lspconfig[server].setup(xopts)
			end
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Mason

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr> " } },

		opts = function()
			local servers = {}
			for _, value in pairs(require("user.constants").lsp_to_mason) do
				table.insert(servers, value.mason)
			end
			return { ensure_installed = servers }
		end,

		config = function(plugin, opts)
			require("user.servers.lsp.handlers").setup()
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, value in ipairs(opts.ensure_installed) do
				local p = mr.get_package(value)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ null-ls

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		enabled = true,
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.stylua,
				},
			}
		end,
	},
}

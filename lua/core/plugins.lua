local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("kanagawa").setup({
				theme = "wave",
			})
			vim.cmd.colorscheme "kanagawa-wave"
		end
	},
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",

	-- completions
	"hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"glepnir/lspsaga.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {"nvim-lua/plenary.nvim"},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					hijack_netrw_behavior = "open_default"
				},
				window = {
					position = "right",
				},
			})
		end,
	},
  {
    'ray-x/lsp_signature.nvim',
    config = function()
        require('lsp_signature').setup {
            handler_opts = {
              border = "rounded"
            },
            hint_enable = false,
        }
    end,

  },
  {
"lukas-reineke/lsp-format.nvim",
    event = { "BufReadPre", "BufNewFile" },
  }
}

local opts = {}

require("lazy").setup(plugins, opts)

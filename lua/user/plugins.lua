local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user.after
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- USE in conjunction with neotree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -----------------------------------------------------
  --REQUIRED-------------------------------------------
  -----------------------------------------------------
  use("nvim-lua/plenary.nvim")

  -- ICONS
  use({
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  })

  -- File Tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          position = "right",
        },
      })
    end
  }

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("user.after.telescope")
    end
  })
  use "nvim-telescope/telescope-media-files.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- LSP
  use {
    'junnplus/lsp-setup.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("user.after.null")
    end,
    requires = { "nvim-lua/plenary.nvim", "MunifTanjim/prettier.nvim", "jayp0521/mason-null-ls.nvim" },
  })

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  -- AFTER LSP
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end
  })


  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("user.after.treesitter")
    end
  }

  -- Mini
  use({
    "echasnovski/mini.nvim",
    config = function()
      require("user.after.mini.base16")
      require("user.after.mini.comment")
      require("user.after.mini.indentscope")
      require("user.after.mini.jump2d")
      require("user.after.mini.pairs")
      require("user.after.mini.statusline")
      require("user.after.mini.tabline")
    end,
  })

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'

  use ({
    'kristijanhusak/vim-dadbod-ui',
    config = function()
      require("user.after.dadbod")
    end,
    requires = { 'tpope/vim-dadbod' }
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

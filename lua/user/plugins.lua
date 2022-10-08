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
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use 'folke/tokyonight.nvim'

  -- completion plugins (cmp)
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"

  -- snippets plugin
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"

  -- lsp plugins
  use 'hrsh7th/cmp-nvim-lsp' --
  use 'hrsh7th/cmp-nvim-lua'
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Telescope (fzf)
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- autopairs
  use "windwp/nvim-autopairs"

  -- nvim-tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- bufferline
  --  use "akinsho/bufferline.nvim"
  use 'noib3/nvim-cokeline'

  -- lualine
  use 'nvim-lualine/lualine.nvim'

  -- indentation guidelines
  use "lukas-reineke/indent-blankline.nvim"

  --debugger
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  --use "nvim-telescope/telescope-dap.nvim"
  use "Pocco81/DAPInstall.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

return {
   "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    dependencies = {
      "RRethy/nvim-treesitter-textsubjects",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      ensure_installed = {
        "lua",
      },
      autotag = {
        enable = true,
      },
      textsubjects = {
        enable = true,
        keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ['i;'] = 'textsubjects-container-inner',
        },
      },
    })
    require"treesitter-context".setup{
      enable = true,
    }
  end
}

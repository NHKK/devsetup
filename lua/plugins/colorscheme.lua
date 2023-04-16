return {
  -- kanagawa
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    keys = {
      { "<leader>cl", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Select Colorscheme with Preview" }
    },
    config = function()
      require("nightfox").setup({
        palettes = {
          duskfox = {
            bg1 = "#000000", 
            bg0 = "#1d1d2b",
            bg3 = "#121820",
            sel0 = "#131b24",
          },
        },
        specs = {
          all = {
            inactive = "bg0",
          },
          duskfox = {
            inactive = "#090909",
          },
        },
        groups = {
          all = {
            NormalNC = { fg = "fg1", bg = "inactive" },
          },
        },
      })
      vim.cmd.colorscheme "duskfox"
    end
  },
  -- kanagawa
  --[[
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    keys = {
      { "<leader>cl", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Select Colorscheme with Preview" }
    },
    config = function()
      require("kanagawa").setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme "kanagawa"
    end
  },
  --]]
  -- catppuccin
  --[[
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    keys = {
      { "<leader>cl", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Select Colorscheme with Preview" }
    },
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme "kanagawa"
    end
  },
  --]]
}

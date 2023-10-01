return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "debugloop/telescope-undo.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>:Telescope find_files<CR>", { "n" }, desc = "Telescope files" },
    { "<leader>fg", "<cmd>:Telescope live_grep<CR>",  { "n" }, desc = "Telescope grep" },
    { "<leader>fh", "<cmd>:Telescope help_tags<CR>",  { "n" }, desc = "Telescope help" },
    { "<leader>fb", "<cmd>:Telescope buffers<CR>",    { "n" }, desc = "Telescope buffer" },
    { "<leader>fu", "<cmd>:Telescope undo<CR>",       { "n" }, desc = "Telescope undo" },
  },
  opts = {
    defaults = {
      path_display = { "smart" },
      file_ignore_patterns = { ".git/" },
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
    extensions = {
      fzf = {
        theme = "jellybeans",
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
    },
  },
  config = function()
    -- Load the extensions
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("undo")
  end,
}


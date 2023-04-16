-- Ignore files bigger than a threshold
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

local enable_previewer = false

local function find_files_or_git_files()
  if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
    local opts = {
      previewer = enable_previewer,
      show_untracked = true,
    }

    require("telescope.builtin").git_files(opts)
  else
    local opts = {
      previewer = enable_previewer,
      no_ignore = true,
      hidden = true
    }

    require("telescope.builtin").find_files(opts)
  end
end

local function live_grep()
  require('telescope').extensions.live_grep_args.live_grep_args()
end

local function file_browser()
  require('telescope').extensions.file_browser.file_browser({
  })
end

local function lsp_definitions()
  require("telescope.builtin").lsp_definitions(require('telescope.themes').get_dropdown {
    show_line = true,
  })
end

local function lsp_references()
  require("telescope.builtin").lsp_references(require('telescope.themes').get_dropdown {
    show_line = true,
  })
end

local function lsp_implementations()
  require("telescope.builtin").lsp_implementations(require('telescope.themes').get_dropdown {
    show_line = true,
  })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", find_files_or_git_files, mode = "n", desc = "Find Files or Git Files" },
      { "<leader>fg", live_grep, mode = "n", desc = "Live Grep (Args)" },
      { "<leader>fe", file_browser, mode = "n", desc = "File Browser" },
      { "gd", lsp_definitions, mode = "n", desc = "LSP Find Definitions" },
      { "gr", lsp_references, mode = "n", desc = "LSP Find References" },
      { "gi", lsp_implementations, mode = "n", desc = "LSP Find Implementations" },
    },
    config = function()
      require("telescope").setup {
        defaults = {
          buffer_previewer_maker = new_maker,
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
              ["<c-j>"] = require("telescope.actions").move_selection_next,
              ["<c-k>"] = require("telescope.actions").move_selection_previous,
              ["<c-s>"] = require("telescope.actions").select_vertical,
            }
          }
        },
        extensions = {
          file_browser = {
            previewer = true,
            theme = "dropdown",
            hijack_netrw = true,
            initial_mode = "normal",
            git_status = false,
            mappings = {
              i = {
                ["<esc>"] = false
              }
            }
          }
        }
      }
    end
  },

  -- file browser extension for telescope.nvim
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true
  },

  -- enable passing arguments to the live_grep of telescope
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    lazy = true
  },

}

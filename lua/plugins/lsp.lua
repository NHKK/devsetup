local function lsp_related_ui_adjust()
  require("lspconfig.ui.windows").default_options.border = "rounded"
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.diagnostic.config({
    virtual_text = {
      prefix = '●',
      severity_sort = true,
      spacing = 4
    },
    float = {
      border = "rounded",
      source = "always", -- Or "if_many"
      prefix = " - ",
    },
    severity_sort = true,
  })
end

local format = function()
  local buf = vim.api.nvim_get_current_buf()
  if require("core.autoformat").autoformat == false then
    return
  end

  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format({
    bufnr = buf,
    timeout_ms = 5000,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  })
end

local servers = {
  pyright = {
    name = "pyright",
    config = {
      settings = {
        python = {
          analysis = {
            diagnosticMode = "openFilesOnly"
          }
        }
      }
    }
  },
  tsserver = {
    name = "typescript-language-server",
  },
  lua_ls = {
    name = "lua-language-server",
    config = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            -- library = vim.api.nvim_get_runtime_file("", true),
            library = {
              vim.fn.stdpath("config"),
            },
            checkThirdParty = false
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false
          }
        }
      }
    }
  }
}

local function lspconfig_setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
          buffer = bufnr,
          callback = function()
            if not require("core.autoformat").autoformat then
              return
            end
            format()
          end,
        })

        vim.api.nvim_create_user_command("FormatToggle", function()
          require("core.autoformat").toggle()
        end, { desc = "Toggle Format on Save" })
      end

      local opts = { buffer = bufnr }

      vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set({ 'i', 'n' }, '<C-s>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

      -- auto show diagnostic when cursor hold
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local float_opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          }

          if not vim.b.diagnostics_pos then
            vim.b.diagnostics_pos = { nil, nil }
          end

          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
              and #vim.diagnostic.get() > 0
          then
            vim.diagnostic.open_float(nil, float_opts)
          end

          vim.b.diagnostics_pos = cursor_pos
        end,
      })
    end
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  local setup_server = function(server, config)
    if not config then
      return
    end

    if type(config) ~= "table" then
      config = {}
    end

    config = vim.tbl_deep_extend("force", {
      capabilities = capabilities,
    }, config)

    require("lspconfig")[server].setup(config)
  end

  for server, setting in pairs(servers) do
    if setting.disabled then
      goto continue
    end

    if setting.config ~= nil then
      setup_server(server, setting.config)
    else
      setup_server(server, {})
    end

    ::continue::
  end
end

return {
  -- configuration for nvim lsp
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {

      -- nvim-cmp source for neovim's built-in LSP
      {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
      },

      -- Use Neovim as a language server to inject LSP
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("null-ls").setup()
        end
      },
    },
    config = function()
      lsp_related_ui_adjust()
      lspconfig_setup()
    end
  },

  -- managing tool for lsp
  {
    "williamboman/mason.nvim",
    dependencies = {
      -- bridges mason with the lspconfig
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup {}
        end
      },

      -- Install and upgrade third party tools automatically
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
          local server_names = {}
          for server, setting in pairs(servers) do
            table.insert(server_names, setting.name)
          end
          require("mason-tool-installer").setup({
            ensure_installed = server_names
          })
        end
      },

      -- bridges mason.nvim with the null-ls plugin
      {
        "jay-babu/mason-null-ls.nvim",
        config = function()
          local nls = require("null-ls")
          require("mason-null-ls").setup {
            ensure_installed = {
              "prettier",
            },
            handlers = {
              prettier = function(source_name, methods)
                nls.register(nls.builtins.formatting.prettier.with({
                  filetypes = { "ts", "js" },
                  extra_args = { "--print-width", "120" }
                }))
              end,
            }
          }
        end
      },
    },
    config = function()
      require("mason").setup {
        providers = {
          "mason.providers.registry-api", -- default
          "mason.providers.client",
        },
        ui = {
          height = 0.85,
          border = "rounded",
        }
      }
    end
  },
}

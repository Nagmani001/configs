-- LSP servers. LazyVim owns the lifecycle: it merges these into vim.lsp.config()
-- and drives mason-lspconfig's ensure_installed, so servers listed here are
-- installed and enabled automatically. Keymaps (gd, K, <leader>cr, <leader>ca)
-- come from LazyVim -- don't re-map them per server.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },

        ts_ls = {
          filetypes = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
          },
        },

        prismals = {},
        tailwindcss = {},

        jsonls = {
          settings = {
            json = {
              schemas = {
                {
                  description = "TypeScript Configuration",
                  fileMatch = { "tsconfig.json" },
                  url = "http://json.schemastore.org/tsconfig",
                },
              },
            },
          },
        },

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              check = { command = "clippy" },
              procMacro = { enable = true },
            },
          },
        },

        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
          },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "prisma" } },
  },
}

return {
  { "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  { "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
      })
    end,
  },
  { "neovim/nvim-lspconfig",
    config = function()
      -- Updated capabilities for Neovim 0.8 and newer
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local lspconfig = require("lspconfig")

      -- Python with pyright
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- PHP with intelephense
      lspconfig.intelephense.setup({
        capabilities = capabilities,
      })

      -- JavaScript and TypeScript with tsserver
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      -- HTML, CSS, JSON with vscode-langservers-extracted
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      -- Lua development, especially useful for Neovim config
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              -- Adjust your Lua version as necessary
              checkThirdParty = false,
            },
            -- Adjust as necessary
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Key mappings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}


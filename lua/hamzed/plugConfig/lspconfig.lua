local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "clangd", "cssls", "eslint", "emmet_ls" },
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").emmet_ls.setup {}

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require("lspconfig").clangd.setup {
  capabilities = capabilities,
}

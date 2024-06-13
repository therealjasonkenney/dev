local M = {}

function M.on_setup()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("lspconfig").tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      require("plugins.lsp.keybinds").set_keybinds(bufnr)

      client.server_capabilities.documentFormattingProvider = false
    end,
  })
end

return M

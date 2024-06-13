local M = {}

local on_attach = function(client, bufnr)
  local fmt = require("plugins.lsp.formatting")
  local keybinds = require("plugins.lsp.keybinds")

  keybinds.set_keybinds(bufnr)
  fmt.setup_auto_format(client, bufnr)
end

function M.on_setup(server_name)
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("lspconfig")[server_name].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

return M

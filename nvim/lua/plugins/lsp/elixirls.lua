local M = {}

local on_attach = function(client, bufnr)
  local keybinds = require("plugins.lsp.keybinds")
  local fmt = require("plugins.lsp.formatting")

  keybinds.set_keybinds(bufnr)
  fmt.setup_auto_format(client, bufnr)
end

function M.on_setup()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("lspconfig").elixirls.setup({
    capabilities = capabilities,
    cmd = { "elixir-ls" },
    on_attach = on_attach,
  })
end

return M

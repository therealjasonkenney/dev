local M = {}

function M.on_setup()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("lspconfig").biome.setup({
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
    },
    on_attach = function(_, bufnr)
      require("plugins.lsp.keybinds").set_keybinds(bufnr)
    end,
  })
end

return M

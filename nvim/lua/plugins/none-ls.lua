-- Used for formatting when the lsp formatter does not work.
local augroup = vim.api.nvim_create_augroup("NoneLsFormatting", {})

local on_attach = function(client, bufnr)
  local keybinds = require("keybinds")

  if client.supports_method("textDocument/formatting") then
    keybinds.set_format("n", function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end, {})

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(filter_client)
            return filter_client.name == "null_ls"
          end,
        })
      end,
    })
  end
end

local function config()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.biome,
      null_ls.builtins.formatting.stylua,
    },
    on_attach = on_attach,
  })
end

return {
  "nvimtools/none-ls.nvim",
  config = config,
  dependencies = {
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      dependencies = { "williamboman/mason.nvim" },
    },
    "nvim-lua/plenary.nvim",
  },
}

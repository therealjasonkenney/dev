local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function lsp_format(bufnr)
  vim.lsp.buf.format({
    async = false,
    bufnr = bufnr,
  })
end

function M.setup_auto_format(client, bufnr)
  local keybinds = require("keybinds")
  local opts = { buffer = bufnr }

  keybinds.set_format("n", function()
    lsp_format(bufnr)
  end, opts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        lsp_format(bufnr)
      end,
      group = augroup,
    })
  end
end

return M

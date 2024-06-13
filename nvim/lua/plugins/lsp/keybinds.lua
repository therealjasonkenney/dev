local M = {}

function M.set_keybinds(bufnr)
  local builtin = require("telescope.builtin")
  local keybinds = require("keybinds")

  local opts = { buffer = bufnr }

  -- Use LSP for these.
  keybinds.set_code_action("n", vim.lsp.buf.code_action, opts)

  keybinds.set_goto_declaration("n", vim.lsp.buf.declaration, opts)
  keybinds.set_prev_diagnostic("n", vim.diagnostic.get_prev, opts)
  keybinds.set_next_diagnostic("n", vim.diagnostic.get_next, opts)
  keybinds.set_rename("n", vim.lsp.buf.rename, opts)
  keybinds.set_show_hover("n", vim.lsp.buf.hover, opts)
  keybinds.set_open_float("n", vim.diagnostic.open_float, opts)

  -- Use telescope for some stuff here.
  keybinds.set_goto_definition("n", builtin.lsp_definitions, opts)
  keybinds.set_goto_type_def("n", builtin.lsp_type_definitions, opts)
  keybinds.set_goto_references("n", builtin.lsp_references, opts)
  keybinds.set_show_diagnostics("n", function()
    builtin.diagnostics({ bufnr = bufnr })
  end, opts)
end

return M

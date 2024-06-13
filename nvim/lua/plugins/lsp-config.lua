local function float_prefix(diagnostic, i, total)
  local prefixes = {}

  prefixes[vim.diagnostic.severity.ERROR] = "E"
  prefixes[vim.diagnostic.severity.HINT] = "H"
  prefixes[vim.diagnostic.severity.INFO] = "I"
  prefixes[vim.diagnostic.severity.WARN] = "W"

  local format = "[%1s (%02d/%02d)]: "
  local sign = prefixes[diagnostic.severity]

  return string.format(format, sign, i, total)
end

local function lsp_config()
  local default_setup = require("plugins.lsp.default_lsp").on_setup

  require("mason-lspconfig").setup_handlers({
    default_setup,
    ["biome"] = require("plugins.lsp.biome").on_setup,
    ["elixirls"] = require("plugins.lsp.elixirls").on_setup,
    ["lua_ls"] = require("plugins.lsp.lua_ls").on_setup,
    ["tsserver"] = require("plugins.lsp.tsserver").on_setup,
  })

  -- We don't install these with mason, as they are project specific.
  default_setup("ruby_lsp")
  default_setup("rust_analyzer")

  vim.diagnostic.config({
    float = {
      border = "rounded",
      source = true,
      header = "Diagnostics\n--------",
      prefix = float_prefix,
    },
    severity_sort = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = false,
  })
end

return {
  -- Language servers and installation.
  {
    "neovim/nvim-lspconfig",
    config = lsp_config,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "nvim-telescope/telescope.nvim",
      "lbrayner/vim-rzip", -- required for tsserver & yarn to behave.
    },
  },
}

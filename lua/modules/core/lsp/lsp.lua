local M = {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    { "hrsh7th/nvim-cmp" },
    { "SmiteshP/nvim-navic" },
  },
}

-- No opts required.
function M.config()
  require "diagflow"

  -- Set up the signs for diagnostics.
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- Diagnostic configuation.
  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    code_lens_refresh = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  local lspconfig = require "lspconfig"
  local attach_servers = function(servers)
    local retrieve = require("settings.servers").retrieve
    for _, server in pairs(servers) do
      server = vim.split(server, "@")[1]
      lspconfig[server].setup(retrieve(server))
    end
  end

  attach_servers(require("utils").auto_configure)
end

return M

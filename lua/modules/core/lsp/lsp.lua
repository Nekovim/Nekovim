local M = {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

-- No opts required.
function M.config()
  local cmp_nvim_lsp = require "cmp_nvim_lsp"
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

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

  local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "lua_ls" then
      client.server_capabilities.documentFormattingProvider = false
    end

    local mappings = require "mappings"

    -- lsp_keymaps(bufnr)
    mappings.register(mappings.lsp_all.normal, bufnr)
    require("illuminate").on_attach(client)
  end

  local attach_servers = function(servers)
    for _, server in pairs(servers) do
      Opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      server = vim.split(server, "@")[1]

      local require_ok, conf_opts = pcall(require, "settings." .. server)
      if require_ok then
        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
      end

      lspconfig[server].setup(Opts)
    end
  end

  attach_servers(require("utils").managed)
  attach_servers(require("utils").unmanaged.servers)
end

return M

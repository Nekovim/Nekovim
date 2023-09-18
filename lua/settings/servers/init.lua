local M = {}

M.default_capabilities = vim.lsp.protocol.make_client_capabilities()
M.default_capabilities.textDocument.completion.completionItem.snippetSupport = true

M.default_on_attach = function(client, bufnr)
  local mappings = require("mappings.lsp")[client.name] or require("mappings.lsp").default
  require("mappings.utils").register_all(mappings, bufnr)
  require("illuminate").on_attach(client)
  require("nvim-navic").attach(client, bufnr)
end

M.retrieve = function(server)
  local opts = {
    on_attach = M.default_on_attach,
    capabilities = M.default_capabilities,
  }

  local require_ok, server_opts = pcall(require, "settings.servers." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", opts, server_opts)
  end

  return opts
end

return M

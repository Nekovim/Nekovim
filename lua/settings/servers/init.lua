local M = {}

M.default_on_attach = function(client, bufnr)
  local mappings = require("mappings.lsp")[client.name] or require("mappings.lsp").default
  require("mappings.utils").register_all(mappings, bufnr)
  require("illuminate").on_attach(client)
  require("nvim-navic").attach(client, bufnr)
end

M.retrieve = function(server)
  local opts = {
    on_attach = M.default_on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }

  local require_ok, server_opts = pcall(require, "settings.servers." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", opts, server_opts)
  end

  return opts
end

return M

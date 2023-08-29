local M = {}

-- Register lsp bindings.
M.register = function(mappings, bufnr, mode)
  local opts = {
    mode = mode or "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = bufnr, -- nil for Global mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymapsneovim call local lua function from keymapping
    nowait = true, -- use `nowait` when creating keymaps
  }


  require("which-key").register(mappings, opts)
end

M.register_all = function(mappings, bufnr)
  M.register(mappings.normal, bufnr)
  M.register(mappings.insert, bufnr, "i")
  M.register(mappings.visual, bufnr, "v")
end

return M

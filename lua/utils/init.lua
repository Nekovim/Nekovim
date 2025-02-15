-- Load Utility Functions
require "utils.wrapping"

-- Mason will install this and lspconfig will auto setup in correct buffer.
local install_and_configure = {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  -- "clangd",
  -- "cmake",
  "pyright",
  -- "csharp_ls",
  -- "gopls",
  "ts_ls",
  -- "svelte",
  -- "vuels",
  "volar",
  "eslint",
  "html",
  "cssls",
}

-- lspconfig will autoset up but will NOT be installed by mason.
local auto_configure = {
  -- "gdscript",
}

-- Mason will ensure all of these are installed but they will not be managed by lsp config.
local ensure_installed = {
  lsp = {
    -- "jdtls",
    "rust_analyzer",
  },
  dap = {
    "javatest",
    "javadbg",
    "python",
    -- "codelldb",
  },
  tools = {
    -- "gdtoolkit",
    "black",
    "flake8",
    "prettier",
    -- "clang-format",
    -- "csharpier",
    -- "google-java-format",
    "stylua",
    -- "goimports-revirser",
    -- "golines",
  },
}

ensure_installed.lsp = vim.list_extend(ensure_installed.lsp, install_and_configure)
M = {
  auto_configure = vim.list_extend(auto_configure, install_and_configure),
  ensure_installed = ensure_installed,
}

M.restart_lsp = function (lsp)

end

return M

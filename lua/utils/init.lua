-- Load Utility Functions
require "utils.wrapping"

local install_and_configure = {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "html",
  "tsserver",
  "eslint",
  "svelte",
  "vuels",
  "pyright",
  "csharp_ls",
  "clangd",
  "gopls",
  "cmake",
  "cssls",
}

local auto_configure = {
  "gdscript",
}

local ensure_installed = {
  lsp = {
    "jdtls",
    "rust_analyzer",
  },
  dap = {
    "javatest",
    "javadbg",
    "python",
    "codelldb"
  },
  tools = {
    "gdtoolkit",
    "black",
    "flake8",
    "prettier",
    "clang-format",
    "csharpier",
    "google-java-format",
    "stylua",
    "goimports-revirser",
    "golines",
  },
}

ensure_installed.lsp = vim.list_extend(ensure_installed.lsp, install_and_configure)
return {
  auto_configure = vim.list_extend(auto_configure, install_and_configure),
  ensure_installed = ensure_installed,
}

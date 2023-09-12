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
  "gdscript"
}

local ensure_installed = {
  "jdtls",
}

local M = {
  auto_configure = vim.list_extend(install_and_configure, auto_configure),
  ensure_installed = vim.list_extend(install_and_configure, ensure_installed),
}

-- Utils Table
local N = {}

N.managed = {
  -- Lua & System
  lua_ls = "lua_ls", -- Lua LSP
  bashls = "bashls", -- Bash LSP

  -- Markup & Data Formats
  -- "typst-lsp",            -- Tyspt LSP
  jsonls = "jsonls", -- JSON LSP
  yamlls = "yamlls", -- YAML LSP
  html = "html", -- HTML LSP

  -- Scripting/Interpreted
  tsserver = "tsserver", -- Typescript & Javascript LSP
  eslint = "eslint", -- Typescript & Javascript Linting
  svelte = "svelte",
  vuels = "vuels",
  pyright = "pyright", -- Python LSP

  -- Mixed
  csharp_ls = "csharp_ls", -- C# via csharp-language-server
  -- omnisharp = "omnisharp",         -- C# via omnisharp-roslyn

  -- Compiled
  clangd = "clangd", -- C/C++ LSP
  gopls = "gopls", -- Go LSP & Formatting

  -- Build Tools
  cmake = "cmake", -- CMake LSP

  --Styling
  cssls = "cssls", -- CSS LSP
}

-- Names only for lspconfig.
N.unmanaged = {
  servers = {
    gdscript = "gdscript", -- gdscript LSP handled by Godot
  },
  linters = {
    -- "cmakelang",
    -- "cmakelint",
    -- "checkstyle",
    gdtoolkit = "gdtoolkit",
  },
  formatters = {
    black = "black",
    ["clang-format"] = "clang-format",
    -- "cmakelang",
    csharpier = "csharpier",
    gdtoolkit = "gdtoolkit",
    golines = "golines",
    ["goimports-reviser"] = "goimports-reviser",
    -- gofumpt = "gofumpt",
    -- goimports = "goimports",
    stylua = "stylua",
  },
}

return N

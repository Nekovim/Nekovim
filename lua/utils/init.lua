-- Load Utility Functions
require "utils.wrapping"

-- Utils Table
local M = {}

M.managed = {
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
  -- "omnisharp",         -- C# via omnisharp-roslyn

  -- Compiled
  clangd = "clangd", -- C/C++ LSP
  gopls = "gopls", -- Go LSP & Formatting

  -- Build Tools
  cmake = "cmake", -- CMake LSP

  --Styling
  cssls = "cssls", -- CSS LSP
}

-- Names only for lspconfig.
M.unmanaged = {
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

return M

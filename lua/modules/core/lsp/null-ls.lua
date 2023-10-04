local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
    {
      "davidmh/cspell.nvim",
      event = "VeryLazy",
    },
  },
}

-- No M.opts needed.
function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics
  local cspell = require "cspell"
  local cspell_config = {
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = vim.diagnostic.severity["HINT"]
    end,
  }

  local on_attach = function(client, bufnr)
    local mappings = require "mappings.lsp"
    require("mappings.utils").register(mappings.default.normal, bufnr)
  end

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    sources = {
      -- Lua
      formatting.stylua,

      -- Javascript, Typescript, HTML, CSS, JSX, JSON
      formatting.prettier.with {
        extra_args = { "--single-quote", "--jsx-single-quote" },
      },

      -- Python
      formatting.black.with { extra_args = { "--fast" } },
      diagnostics.flake8,

      -- Java
      formatting.google_java_format,
      -- C/C++
      formatting.clang_format,

      -- C#
      formatting.csharpier,

      -- Golang
      formatting.gofmt,
      formatting.goimports_reviser,
      formatting.golines,
      -- Godot
      formatting.gdformat,
      diagnostics.gdlint,
    },
    on_attach = on_attach,
  }
end

return M

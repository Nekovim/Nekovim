local M = {
  "folke/twilight.nvim",
  cmd = { "Twilight" },
}

M.opts = {
  dimming = {
    alpha = 0.25,
    inactive = false,
  },
  context = 1,
  treesitter = true,
  expand = {
    -- Defaults
    "function",
    "method",
    "table",
    "if_statement",
    -- Include Yours Here
    "method_definition",
    "function_definition",
    "expression_statement",
    "decorated_definition",
  },
}

return M

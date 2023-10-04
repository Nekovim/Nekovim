local M = {
  "echasnovski/mini.indentscope",
  event = "BufReadPre",
}

M.opts = {
  draw = {
    delay = 35,
    priority = 2,
  },
  mappings = require("mappings.plugins")["mini.indentscope"],
  options = {
    indent_at_cursor = false,
  },
  symbol = "▏",
}

M.config = function(_, opts)
  -- Disable in certain filetypes.
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
      "gd",
      "gdscript",
      "gdscript3",
      "alpha",
      "dashboard",
      "neo-tree",
      "Outline",
      "Trouble",
      "TelescopePrompt",
      "dap-repl",
      "dapui_console",
      "dapui_stacks",
      "dapui_breakpoints",
      "dapui_scopes",
      "dapui_watches",
      "norg"
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })

  require("mini.indentscope").setup(opts)
end

return M

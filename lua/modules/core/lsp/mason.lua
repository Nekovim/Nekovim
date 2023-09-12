local M = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = true,
    },
    {
      "williamboman/mason-null-ls.nvim",
      lazy = true,
    },
    {
      "williamboman/mason-nvim-dap.nvim",
      lazy = true,
    },
    { "rcarriga/nvim-dap-ui" },
  },
}

M.opts = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}
function M.config(_, opts)
  require("mason").setup(opts)
  require("mason-lspconfig").setup {
    ensure_installed = require("utils").ensure_installed.lsp,
    automatic_installation = false,
  }
  require("mason-null-ls").setup {
    ensure_installed = require("utils").ensure_installed.tools,
    automatic_installation = false,
  }
  require("mason-nvim-dap").setup {
    ensure_installed = require("utils").ensure_installed.dap,
    automatic_installation = false,
  }
end

return M

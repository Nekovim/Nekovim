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
      "rcarriga/nvim-dap-ui",
    },
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
  local lsp_opts = {
    ensure_installed = require("utils").managed,
    automatic_installation = true,
  }

  require("mason").setup(opts)
  require("mason-lspconfig").setup(lsp_opts)
end

return M

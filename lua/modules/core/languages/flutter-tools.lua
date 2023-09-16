local M = {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope.nvim",
  },
}

M.opts = {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
      project_config = true,
    }
  },

  lsp = {
    on_attach = function(client, bufnr)
      local mappings = require("mappings.lsp").dart
      require("mappings.utils").register_all(mappings, bufnr)

      require("illuminate").on_attach(client)
      require("nvim-navic").attach(client, bufnr)
    end,
    capabilities = nil,
  },

  debugger = {
    enabled = true,
    run_via_dap = true,
    -- register_configurations = function(_)
    --   require("dap").configurations.dart = {}
    --   require("dap.ext.vscode").load_launchjs()
    -- end
  }
}

M.config = function(_, opts)
  require("flutter-tools").setup(opts)
  require("telescope").load_extension "flutter"
end

return M

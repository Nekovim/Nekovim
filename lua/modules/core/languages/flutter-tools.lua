local M = {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "mfussenegger/nvim-dap" },
    { "nvim-telescope/telescope.nvim" },
    { "hrsh7th/nvim-cmp" },
  },
}

M.opts = {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
      project_config = true,
    },
  },

  debugger = {
    enabled = true,
    run_via_dap = true,
    -- register_configurations = function(_)
    --   require("dap").configurations.dart = {}
    --   require("dap.ext.vscode").load_launchjs()
    -- end
  },
}

M.config = function(_, opts)
  opts.lsp = {
    on_attach = require("settings.servers").default_on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }

  require("flutter-tools").setup(opts)
  require("telescope").load_extension "flutter"
end

return M

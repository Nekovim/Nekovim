local M = {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

M.opts = {
  lsp = {
    on_attach = function(client, bufnr)
      local mappings = require("mappings.lsp").dart
      require("mappings.utils").register_all(mappings, bufnr)

      require("illuminate").on_attach(client)
      require("nvim-navic").attach(client, bufnr)
    end,
    capabilities = nil,
  },
}

M.config = function(_, opts)
  require("flutter-tools").setup(opts)
  require("telescope").load_extension "flutter"
end

return M

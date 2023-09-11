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
      local mappings = require("mappings.lsp").default
      require("mappings.utils").register_all(mappings, bufnr)

      -- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
      --   buffer = bufnr,
      --   callback = vim.lsp.codelens.refresh,
      -- })
      --
      -- vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
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

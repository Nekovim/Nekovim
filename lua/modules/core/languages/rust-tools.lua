-- Update this path
local extension_path = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so" -- MacOS: This may be .dylib

local M = {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}

M.opts = {
  tools = {
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      only_current_line = false,
      -- parameter_hints_prefix = "() ",
      -- other_hints_prefix = "-> ",
    },
    hover_actions = {
      auto_focus = true,
    },
    runnables = {
      use_telescope = true,
    },
  },
  server = {
    -- on_attack for lsp
    on_attach = function(client, bufnr)
      local mappings = require("mappings.lsp").rust
      require("mappings.utils").register_all(mappings, bufnr)

      vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })

      vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
      require("illuminate").on_attach(client)
      require("nvim-navic").attach(client, bufnr)
    end,

    flags = {
      debounce_text_changes = 150,
    },
  },
}

function M.config(_, opts)
  opts.dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  }
  require("rust-tools").setup(opts)
end

return M

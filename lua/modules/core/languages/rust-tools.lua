-- Update this path
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/"
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
    on_attach = function(_, bufnr)
      local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymapsneovim call local lua function from keymapping
        nowait = true, -- use `nowait` when creating keymaps
      }

      -- These need to be here because rust tools has it's own weird thing going on.
      local mappings = require("mappings").lsp
      mappings.c.a = { "<cmd>lua require('rust-tools').code_action_group.code_action_group()<cr>", "Code Actions" }
      mappings.c.h = { "<cmd>lua require('rust-tools').hover_actions.hover_actions()<cr>", "Code Hover" }

      require("which-key").register(mappings, opts)

      vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })

      vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
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

local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

M.opts = {
  lsp = {
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },

  messages = {
    enabled = true,
    view = "mini",
    view_error = "messages",
    view_warn = "mini",
    view_history = "messages",
    view_search = "virtualtext",
  },

  notify = {
    enabled = true,
    view = "mini",
  },

  views = {
    mini = {
      timeout = 5000,
    },
  },
}

M.config = function(_, opts)
  require("notify").setup {
    render = "compact",
    stages = "slide",
    background_colour = "#26233a",
    timeout = 5000,
  }
  require("noice").setup(opts)
end

return M

local M = {
  "folke/edgy.nvim",
  event = "VeryLazy",
  -- enabled = false,
}

M.init = function()
  vim.opt.laststatus = 3
  vim.opt.splitkeep = "screen"
end

M.opts = {
  options = {
    left = { size = 40 },
    bottom = { size = 15 },
  },

  exit_when_last = true,

  bottom = {
    -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
    {
      ft = "toggleterm",
      size = { height = 0.4 },
      -- exclude floating windows
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    {
      ft = "lazyterm",
      title = "LazyTerm",
      size = { height = 0.4 },
      filter = function(buf)
        return not vim.b[buf].lazyterm_cmd
      end,
    },
    "Trouble",
    { ft = "qf", title = "QuickFix" },
    {
      ft = "help",
      size = { height = 20 },
      -- only show help buffers
      filter = function(buf)
        return vim.bo[buf].buftype == "help"
      end,
    },
    { ft = "spectre_panel", size = { height = 0.4 } },
  },

  left = {
    -- Neo-tree filesystem always takes half the screen height
    {
      title = "Neo-Tree",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "filesystem"
      end,
      pinned = true,
      open = "Neotree show",
      size = { height = 0.5 },
    },
    {
      title = "Neo-Tree Buffers",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "buffers"
      end,
      pinned = true,
      open = "Neotree buffers",
    },
    {
      ft = "Outline",
    },
    {
      title = "Flutter Outline",
      ft = "flutterToolsOutline",
    },
    -- any other neo-tree windows
    -- "neo-tree",
  },
}

return M

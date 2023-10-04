local M = {
  "epwalsh/obsidian.nvim",
  lazy = false,
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
}

M.opts = {
  dir = require("user-options").obsidian_vault_dir, -- no need to call 'vim.fn.expand' here
  finder = "telescope.nvim",
  -- see below for full list of options 👇
}

return M

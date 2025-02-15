local M = {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  enabled = false
}

local valid_names = {
  ["gruvbox"] = true,
}

M.opts = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

M.config = function(_, opts)
  require("gruvbox").setup(opts)
  if valid_names[require("user-options").primary_theme] then
    pcall(vim.cmd.colorscheme, require("user-options").primary_theme)
  end
end

return M

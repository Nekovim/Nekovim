local M = {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000,
}

local valid_names = {
  ["tokyonight"] = true,
  ["tokyonight-day"] = true,
  ["tokyonight-moon"] = true,
  ["tokyonight-night"] = true,
  ["tokyonight-storm"] = true,
}

M.config = function(_, opts)
  require("tokyonight").setup(opts)
  if valid_names[require("user-options").primary_theme] then
    pcall(vim.cmd.colorscheme, require("user-options").primary_theme)
  end
end

return M

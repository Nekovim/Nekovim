local M = {
  "Shatur/neovim-ayu",
  priority = 1000,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
}

local valid_names = {
  ["ayu"] = true,
  ["ayu-light"] = true,
  ["ayu-dark"] = true,
  ["ayu-mirage"] = true,
}

M.config = function(_, opts)
  if valid_names[require("user-options").primary_theme] then
    pcall(vim.cmd.colorscheme, require("user-options").primary_theme)
  end
end

return M

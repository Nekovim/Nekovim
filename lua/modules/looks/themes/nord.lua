local M = {
  "shaunsingh/nord.nvim",
  priority = 1000,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  enabled = false
}

local valid_names = {
  ["nord"] = true,
}

M.config = function()
  if valid_names[require("user-options").primary_theme] then
    pcall(vim.cmd.colorscheme, require("user-options").primary_theme)
  end
end

return M

local M = {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
}

local valid_names = {
  ["kanagawa"] = true,
  ["kanagawa-wave"] = true,
  ["kanagawa-dragon"] = true,
  ["kanagawa-lotus"] = true,
}

M.opts = {
  compile = false, -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = { -- add/modify theme and palette colors
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  overrides = function(colors) -- add/modify highlights
    return {}
  end,
  theme = "wave", -- Load "wave" theme when 'background' option is not set
  background = { -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus",
  },
}

M.config = function(_, opts)
  require("kanagawa").setup(opts)
  if valid_names[require("user-options").primary_theme] then
    pcall(vim.cmd.colorscheme, require("user-options").primary_theme)
  end
end

return M

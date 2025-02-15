local M = {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  enabled = false
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
    theme = {
      wave = {},
      lotus = {},
      dragon = {},
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
  overrides = function(colors) -- add/modify highlights
    return {
      String = { italic = true },
      Boolean = { italic = true, bold = false },
      Conditional = { italic = true, fg = colors.palette.oniViolet },
      Repeat = { italic = true },
      ["@parameter"] = { italic = true, fg = colors.palette.oniViolet },
      ["@neorg.markup.bold.norg"] = { fg = colors.palette.waveAqua2, bold = true },
      ["@neorg.markup.italic.norg"] = { fg = colors.palette.oniViolet, italic = true },
      ["@neorg.links.location.url.norg"] = { fg = colors.palette.fujiGray, italic = true },
    }
  end,
  theme = "wave", -- Load "wave" theme when 'background' option is not set
  background = { -- map the value of 'background' option to a theme
    dark = "wave", -- try "dragon" !
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

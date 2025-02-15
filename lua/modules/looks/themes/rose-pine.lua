local M = {
  "rose-pine/neovim",
  -- dir = "/home/niamh/Repos/forks/neovim/rose-pine.nvim/",
  name = "rose-pine",
  priority = 1000,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  enabled = true
}

local valid_names = {
  ["rose-pine"] = true,
  ["rose-pine-main"] = true,
  ["rose-pine-dawn"] = true,
  ["rose-pine-moon"] = true,
}

M.opts = {
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = "",
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = "main",
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = true,
  disable_italics = false,

  respect_default_highlight_groups = true,
  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    -- Editor
    CursorLine = { bg = "foam", blend = 10 },

    Keyword = { italic = true },
    Function = { italic = false },
    String = { italic = true },
    Boolean = { italic = true },
    Conditional = { italic = true },
    Repeat = { italic = true },
    ["@variable"] = { italic = false },
    ["@parameter"] = { italic = true },
    ["@property"] = { italic = false },

    -- Transparent Telescope
    TelescopeBorder = { fg = "highlight_high", bg = "none" },
    TelescopeNormal = { bg = "none" },
    TelescopePromptNormal = { bg = "base" },
    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
    TelescopeSelection = { fg = "text", bg = "base" },
    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

    -- Norg
    ["@neorg.markup.bold.norg"] = { fg = "iris", bold = true },
    ["@neorg.markup.italic.norg"] = { fg = "foam", italic = true },
    ["@neorg.links.location.url.norg"] = { fg = "muted", italic = true },

    ["@neorg.headings.1.prefix"] = { fg = "gold" },
    ["@neorg.headings.1.title"] = { fg = "gold", bold = true },
    ["@neorg.headings.2.prefix"] = { fg = "rose" },
    ["@neorg.headings.2.title"] = { fg = "rose", bold = true },
    ["@neorg.headings.3.prefix"] = { fg = "love" },
    ["@neorg.headings.3.title"] = { fg = "love" },
    ["@neorg.headings.4.prefix"] = { fg = "iris" },
    ["@neorg.headings.4.title"] = { fg = "iris" },
    ["@neorg.headings.5.prefix"] = { fg = "foam" },
    ["@neorg.headings.5.title"] = { fg = "foam" },
    ["@neorg.headings.6.prefix"] = { fg = "pine" },
    ["@neorg.headings.6.title"] = { fg = "pine" },

    ["@neorg.tags.ranged_verbatim.document_meta.title"] = { fg = "love" },
    ["@neorg.tags.ranged_verbatim.document_meta.description"] = { fg = "rose", italic = true },
    ["@neorg.tags.ranged_verbatim.document_meta.authors"] = { fg = "gold" },
    ["@neorg.tags.ranged_verbatim.document_meta.categories"] = { fg = "iris" },
    ["@neorg.tags.ranged_verbatim.document_meta.created"] = { fg = "muted" },
    ["@neorg.tags.ranged_verbatim.document_meta.updated"] = { fg = "muted" },
    ["@neorg.tags.ranged_verbatim.document_meta.version"] = { fg = "muted" },

    ["@lsp.typemod.annotation.public.java"] = { fg = "gold", italic = true },
  },
}

M.config = function(_, opts)
  require("rose-pine").setup(opts)
  if valid_names[require("user-options").primary_theme] then
    pcall(vim.cmd.colorscheme, require("user-options").primary_theme)
  end
end

return M

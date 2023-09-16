-- Lualine Pre-config
local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  padding = 0,
}

local function navic()
  if require("nvim-navic").is_available() then
    local loc = require("nvim-navic").get_location()
    if loc ~= "" then
      return "> " .. loc
    end
    return " "
  end
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- Lualine Setup
local M = {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

M.opts = {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      "alpha",
      "dashboard",
      "neo-tree",
      "Outline",
      "Trouble",
      "TelescopePrompt",
      "dap-repl",
      "dapui_console",
      "dapui_stacks",
      "dapui_breakpoints",
      "dapui_scopes",
      "dapui_watches",
      "flutterToolsOutline",
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { diagnostics },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },

  winbar = {
    lualine_a = { "filename" },
    lualine_b = { navic },
  },

  inactive_winbar = {
    lualine_a = { "filename" },
    lualine_b = { navic },
  },
}

function M.config(_, opts)
  require("lualine").setup(opts)
end

return M

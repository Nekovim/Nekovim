vim.cmd [[highlight IndentBlanklineIndent1 guifg=#393552 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1f1d2e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#ebbcba gui=nocombine]]

local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
}

M.opts = {
  use_treesitter = true,
  space_char_blankline = " ",

  show_first_indent_level = true,
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = false,

  char = "▏",
  context_char = "▏",
  -- char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
  -- space_char_highlight_list = {
  -- 	"IndentBlanklineIndent1",
  -- 	"IndentBlanklineIndent2",
  -- },
  show_trailing_blankline_indent = false,

  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
    "norg",
    "gd",
    "gdscript",
    "gdscript3",
  },
}

return M

-- vim.keymap.set("i", "<C-.>a", "function<cmd>lua require('luasnip').expand()<cr>", { noremap = false })
-- Base Mappings used for assigning all other LSP mappings.

local M = {}

M.tsserver = {
  a = { "arrowfunc<cmd>lua require('luasnip').expand()<cr>", "() => {}"},
  f = { "function<cmd>lua require('luasnip').expand()<cr>", "function fn (){}"},
}

return M

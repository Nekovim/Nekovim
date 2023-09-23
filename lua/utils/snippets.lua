local ls = require "luasnip"
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node

local M = {}

M.all = {}
M.javascript = {
  -- const {1} ({2}) => {{3}}
  s("arrowfunc", fmt("const {} = ({}) => {}\n\t{}\n{}", {
    i(1, "foo"),
    i(2, "param"),
    t("{"),
    i(3, "return;"),
    t("}"),
  })),
}
M.typescript = {}
M.typescript = vim.tbl_extend("keep", M.typescript, M.javascript)

return M

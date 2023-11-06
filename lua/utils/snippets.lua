local ls = require "luasnip"

local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node
local i = ls.insert_node
local s = ls.s
local t = ls.text_node

local M = {}

M.all = {}
M.javascript = {
  -- const {1} ({2}) => {{3}}
  s(
    "arrowfunc",
    fmt("const {} = ({}) => {}\n\t{}\n{}", {
      i(1, "foo"),
      i(2, "param"),
      t "{",
      i(3, "return;"),
      t "}",
    })
  ),

  -- const [{1}, set{1}] = useState({2})
  s(
    "state",
    fmt("const [{}, set{}] = useState({})", {
      i(1, "foo"),
      f(function(name)
        return name[1][1]:gsub("^%l", string.upper)
      end, { 1 }),
      i(2, "null"),
    })
  ),
}
M.typescript = {}
M.typescript = vim.tbl_extend("keep", M.typescript, M.javascript)
M.typescriptreact = {}
M.typescriptreact = vim.tbl_extend("keep", M.typescriptreact, M.javascript)

return M

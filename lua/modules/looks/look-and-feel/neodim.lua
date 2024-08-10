local M = {
  "zbirenbaum/neodim",
  event = "LspAttach",
  commit = "0543414",
}

M.opts = {
  alpha = 0.0,
  update_in_insert = {
    enable = true,
    delay = 100,
  },
  hide = {
    virtual_text = true,
    signs = false,
    underline = true,
  },
}

M.config = function(_, opts)
  opts.blend_color = "#908CAA"
  require("neodim").setup(opts)
end

return M

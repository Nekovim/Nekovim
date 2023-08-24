local M = {
  "zbirenbaum/neodim",
  event = "LspAttach",
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
  opts.blend_color = "#" .. string.format("%x", vim.api.nvim_get_hl_by_name("Comment", true).foreground)
  require("neodim").setup(opts)
end

return M

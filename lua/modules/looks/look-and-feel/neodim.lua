local M = {
  "zbirenbaum/neodim",
  event = "LspAttach",
  commit = vim.version().minor < 10 and "f11c110" or nil,
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

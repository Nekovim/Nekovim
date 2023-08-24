local M = {
  "lukas-reineke/virt-column.nvim",
  lazy = false,
}

M.opts = {
  char = "▏",
}

M.config = function(_, opts)
  require("virt-column").setup(opts)
end

return M

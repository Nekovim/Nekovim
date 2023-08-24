local M = {
  "Zeioth/markmap.nvim",
  ft = { "markdown" },
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  event = "VeryLazy",
}

M.opts = {
  html_output = "/tmp/markmap.html",
  hide_toolbar = false,
  grace_period = 3600000,
}

M.config = function(_, opts)
  require("markmap").setup(opts)
end

return M

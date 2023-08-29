local M = {
    "folke/persistence.nvim",
    event = "VimEnter",
}

M.opts = {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
}

return M

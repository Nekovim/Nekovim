-- Call CodeLens refresh
vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  once = true,
  callback = vim.lsp.codelens.refresh,
})

-- Norg Mappings in Which-Key
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*.norg",
  callback = function()
    require("which-key").register(require("mappings.neorg").neorg_labels, {
      mode = "n",
      prefix = "<leader>",
      buffer = 0,
      noremap = true,
      silent = true,
    })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gd", "gdscript", "gdscript3", "go" },
  callback = function()
    vim.cmd [[setlocal noexpandtab]]
    vim.cmd [[set tabstop=4]]
    vim.cmd [[set shiftwidth=4]]
  end,
})

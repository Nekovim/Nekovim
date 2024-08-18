-- Call CodeLens refresh
vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  once = true,
  callback = vim.lsp.codelens.refresh,
})

-- Norg Mappings in Which-Key
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = "*.norg",
--   callback = function()
--     require("which-key").register(require("mappings.neorg").neorg_labels, {
--       mode = "n",
--       prefix = "<leader>",
--       buffer = 0,
--       noremap = true,
--       silent = true,
--     })
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "lua", "rust", "typescript", "javascript", "vue", "gd", "gdscript", "gdscript3" },
--   callback = function()
--     local mappings = require("mappings.lsp")[vim.bo.filetype] or require("mappings.lsp").default
--     -- for _, mapping in ipairs(mappings) do
--     --   mapping.buffer = true
--     -- end
--
--     require("which-key").add(mappings)
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gd", "gdscript", "gdscript3" },
  callback = function()
    vim.cmd [[setlocal noexpandtab]]
  end,
})

if vim.loop.os_uname().release:lower():find "microsoft" and true or false then
  vim.cmd [[
    augroup Yank
      autocmd!
      autocmd TextYankPost * :call system('clip.exe ',@")
    augroup END
  ]]
end

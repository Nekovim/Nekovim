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
  pattern = { "gd", "gdscript", "gdscript3" },
  callback = function()
    vim.cmd [[setlocal noexpandtab]]
  end,
})

local hover_files = {
  cpp = true,
  c = true,
  cs = true,
  gdscript = true,
  go = true,
  java = true,
  javascript = true,
  lua = true,
  rust = true,
  md = false,
  norg = false,
  python = true,
  typescript = true,
}

-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
-- 	callback = function()
-- 		if (not hover_files[vim.bo.filetype]) or hover_files[vim.bo.filetype] == nil then
-- 			return
-- 		end
-- 		vim.lsp.buf.hover()
-- 	end,
-- })

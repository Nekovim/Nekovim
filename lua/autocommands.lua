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
		require("which-key").register(require("mappings").neorg_labels, {
			mode = "n",
			prefix = "<leader>",
			buffer = 0,
			noremap = true,
			silent = true,
		})
	end,
})

-- Autosave
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
-- 	pattern = {"*.txt", "*.norg", "*.md"},
-- 	callback = function ()
-- 	   vim.cmd.write()
-- 	end,
-- })

-- Call CodeLens refresh
vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	once = true,
	callback = vim.lsp.codelens.refresh,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		require("which-key").register(require("mappings").neorg, {
			mode = "n",
			prefix = "<leader>",
			buffer = 0,
			noremap = true,
			silent = true,
		})
	end,
})

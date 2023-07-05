-- Call CodeLens refresh
vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	once = true,
	callback = vim.lsp.codelens.refresh,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.norg",
	callback = function()
		require("which-key").register({
			["<leader>n"] = { name = "+neorg" },
			["<leader>ni"] = { name = "+insert" },
			["<leader>nl"] = { name = "+list" },
			["<leader>nm"] = { name = "+mode" },
			["<leader>nn"] = { name = "+note" },
			["<leader>nt"] = { name = "+task" },
		}, { buffer = 0 })
	end,
})

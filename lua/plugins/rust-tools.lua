local M = {
	"simrat39/rust-tools.nvim",
    ft = "rust",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}

function M.config()
	require("rust-tools").setup({
		server = {
			on_attach = function(_, bufnr)
				-- Hover actions
				vim.keymap.set("n", "<leader>ch", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set(
					"n",
					"<Leader>ca",
					require("rust-tools").code_action_group.code_action_group,
					{ buffer = bufnr }
				)
				vim.keymap.set("n", "<leader>ce", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
			end,
		},
	})
end

return M

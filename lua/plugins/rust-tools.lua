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
		inlay_hints = {
			auto = true,
			only_current_line = false,
			parameter_hints_prefix = "() ",
			other_hints_prefix = "-> ",
		},
		server = {
			on_attach = function(_, bufnr)
				local opts = {
					mode = "n", -- NORMAL mode
					prefix = "<leader>",
					buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
					silent = true, -- use `silent` when creating keymaps
					noremap = true, -- use `noremap` when creating keymapsneovim call local lua function from keymapping
					nowait = true, -- use `nowait` when creating keymaps
				}

                -- These need to be here because rust tools has it's own weird thing going on.
				local mappings = require("mappings").lsp
				mappings.c.a = { "<cmd>require('rust-tools').code_action_group.code_action_group<cr>", "Code Actions" }
				mappings.c.h = { "<cmd>require('rust-tools').hover_actions.hover_actions<cr>", "Code Hover" }

				require("which-key").register(mappings, opts)
			end,
		},
	})
end

return M

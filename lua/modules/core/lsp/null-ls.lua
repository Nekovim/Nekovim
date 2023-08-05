local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			lazy = true,
		},
		{
			"davidmh/cspell.nvim",
			event = "VeryLazy",
		},
	},
}

-- No M.opts needed.
function M.config()
	local null_ls = require("null-ls")
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	local formatting = null_ls.builtins.formatting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
	local diagnostics = null_ls.builtins.diagnostics
	local cspell = require("cspell")
	local cspell_config = {
		diagnostics_postprocess = function(diagnostic)
			diagnostic.severity = vim.diagnostic.severity["HINT"]
		end,
	}

	local on_attach = function (client, bufnr)
		local mappings = require("mappings")

		-- lsp_keymaps(bufnr)
		mappings.lsp_register(bufnr, mappings.lsp_diagnostics)
	end

	-- https://github.com/prettier-solidity/prettier-plugin-solidity
	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier.with({
				extra_args = { "--single-quote", "--jsx-single-quote" },
			}),
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			formatting.google_java_format,
			formatting.clang_format,
			formatting.csharpier,
			formatting.gofmt,
			formatting.goimports_reviser,
			formatting.golines,
			formatting.gdformat,
			-- diagnostics.gdlint,
			diagnostics.flake8,
			-- Spelling
			cspell.diagnostics.with(cspell_config),
			cspell.code_actions.with(cspell_config),
		},
		on_attach = on_attach
	})
end

return M

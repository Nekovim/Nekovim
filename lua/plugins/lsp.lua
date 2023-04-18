local M = {
	"neovim/nvim-lspconfig",
	commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
	lazy = true,
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
		},
	},
}

function M.config()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	-- Set up the signs for diagnostics.
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- Diagnostic configuation.
	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	local function lsp_keymaps(bufnr)
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		keymap(bufnr, "n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		keymap(bufnr, "n", "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		keymap(bufnr, "n", "<leader>cI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap(bufnr, "n", "<leader>ce", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
		-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
		keymap(bufnr, "n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		-- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	end

	local lspconfig = require("lspconfig")

	local on_attach = function(client, bufnr)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.name == "lua_ls" then
			client.server_capabilities.documentFormattingProvider = false
		end

		lsp_keymaps(bufnr)
		require("illuminate").on_attach(client)
	end

	for _, server in pairs(require("utils").servers) do
		Opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "settings." .. server)
		if require_ok then
			Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
		end

		lspconfig[server].setup(Opts)
	end
end

return M

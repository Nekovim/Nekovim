local M = {
	"neovim/nvim-lspconfig",
	lazy = true,
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
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
		code_lens_refresh = true,
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

	local function register_mappings(bufnr)
		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymapsneovim call local lua function from keymapping
			nowait = true, -- use `nowait` when creating keymaps
		}

		require("which-key").register(require("mappings").lsp, opts)
	end

	local lspconfig = require("lspconfig")

	local on_attach = function(client, bufnr)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.name == "lua_ls" then
			client.server_capabilities.documentFormattingProvider = false
		end

		-- lsp_keymaps(bufnr)
		register_mappings(bufnr)
		require("illuminate").on_attach(client)

        -- Refresh codelens on TextChange or leaving insert mode.
		-- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
		-- 	buffer = bufnr,
		-- 	callback = vim.lsp.codelens.refresh,
		-- })
		--
		-- vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
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

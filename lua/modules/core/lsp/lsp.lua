local M = {
	"neovim/nvim-lspconfig",
	lazy = true,
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}

-- No opts required.
function M.config()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	require("diagflow")

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

	local lspconfig = require("lspconfig")

	local on_attach = function(client, bufnr)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.name == "lua_ls" then
			client.server_capabilities.documentFormattingProvider = false
		end

		-- TEMP FIX: IF CSHARP BREAKS THIS IS PROBABLY WHY!
		-- https://nicolaiarocci.com/making-csharp-and-omnisharp-play-well-with-neovim/
		if client.name == "omnisharp" then
			client.server_capabilities.semanticTokensProvider = {
				full = vim.empty_dict(),
				legend = {
					tokenModifiers = { "static_symbol" },
					tokenTypes = {
						"comment",
						"excluded_code",
						"identifier",
						"keyword",
						"keyword_control",
						"number",
						"operator",
						"operator_overloaded",
						"preprocessor_keyword",
						"string",
						"whitespace",
						"text",
						"static_symbol",
						"preprocessor_text",
						"punctuation",
						"string_verbatim",
						"string_escape_character",
						"class_name",
						"delegate_name",
						"enum_name",
						"interface_name",
						"module_name",
						"struct_name",
						"type_parameter_name",
						"field_name",
						"enum_member_name",
						"constant_name",
						"local_name",
						"parameter_name",
						"method_name",
						"extension_method_name",
						"property_name",
						"event_name",
						"namespace_name",
						"label_name",
						"xml_doc_comment_attribute_name",
						"xml_doc_comment_attribute_quotes",
						"xml_doc_comment_attribute_value",
						"xml_doc_comment_cdata_section",
						"xml_doc_comment_comment",
						"xml_doc_comment_delimiter",
						"xml_doc_comment_entity_reference",
						"xml_doc_comment_name",
						"xml_doc_comment_processing_instruction",
						"xml_doc_comment_text",
						"xml_literal_attribute_name",
						"xml_literal_attribute_quotes",
						"xml_literal_attribute_value",
						"xml_literal_cdata_section",
						"xml_literal_comment",
						"xml_literal_delimiter",
						"xml_literal_embedded_expression",
						"xml_literal_entity_reference",
						"xml_literal_name",
						"xml_literal_processing_instruction",
						"xml_literal_text",
						"regex_comment",
						"regex_character_class",
						"regex_anchor",
						"regex_quantifier",
						"regex_grouping",
						"regex_alternation",
						"regex_text",
						"regex_self_escaped_character",
						"regex_other_escape",
					},
				},
				range = true,
			}
		end
		
		local mappings = require("mappings")

		-- lsp_keymaps(bufnr)
		mappings.lsp_register(bufnr, mappings.lsp_all)
		require("illuminate").on_attach(client)
	end

	local attach_servers = function(servers)
		for _, server in pairs(servers) do
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

	attach_servers(require("utils").managed)
	attach_servers(require("utils").unmanaged.servers)
end

return M

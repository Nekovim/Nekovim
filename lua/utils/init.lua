-- Load Utility Functions
require("utils.wrapping")

-- Utils Table
local M = {}

M.managed = {
	-- Lua & System
	lua = "lua_ls", -- Lua LSP
	bash = "bashls", -- Bash LSP

	-- Markup & Data Formats
	-- "typst-lsp",            -- Tyspt LSP
	json = "jsonls", -- JSON LSP
	yaml = "yamlls", -- YAML LSP

	-- Scripting/Interpreted
	"pyright", -- Python LSP
	"csharp_ls", -- C# via csharp-language-server
	-- "omnisharp",         -- C# via omnisharp-roslyn

	-- Compiled
	"clangd", -- C/C++ LSP
	"gopls", -- Go LSP & Formatting

	-- Language Management
	"cmake", -- CMake LSP

	-- By & For Stupid People
	"html", -- HTML LSP
	"cssls", -- CSS LSP
	"tsserver", -- Typescript & Javascript LSP
	"eslint", -- Typescript & Javascript Linting
	"svelte",
	"vuels",
}

-- Names only for lspconfig.
M.unmanaged = {
	servers = {
		"gdscript",
	}, -- Godot's Scripting Language
	linters = {
		"gdtoolkit",
		-- "cmakelang",
		-- "cmakelint",
		-- "checkstyle",
	},
	formatters = {
		"clang-format",
		"csharpier",
		"gdtoolkit",
		-- "goimports",
		"goimports-reviser",
		-- "gofumpt",
		"golines",
		"stylua",
		"black",
		-- "cmakelang",
	},
}

return M

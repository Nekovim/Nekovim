local M = {}

M.servers = {
    -- Lua & System
	"lua_ls",               -- Lua LSP
	"bashls",               -- Bash LSP 

    -- Markup & Data Formats
    -- "typst-lsp",            -- Tyspt LSP
	"jsonls",               -- JSON LSP
	"yamlls",               -- YAML LSP
    "html",                 -- HTML LSP

    -- Styling & Framework
    "cssls",                -- CSS LSP

    -- Scripting/Interpreted
	"pyright",              -- Python LSP
    "tsserver",             -- Typescript & Javascript LSP
    "eslint",               -- Typescript & Javascript Linting

    -- Compiled
	"clangd",               -- C/C++ LSP

    -- Language Management
	"cmake",                -- CMake LSP
}

return M

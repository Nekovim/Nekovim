-- Load Utility Functions
require("utils.wrapping")

-- Utils Table
local M = {}

M.servers = {
    -- Lua & System
	"lua_ls",               -- Lua LSP
	"bashls",               -- Bash LSP 

    -- Markup & Data Formats
    -- "typst-lsp",            -- Tyspt LSP
	"jsonls",               -- JSON LSP
	"yamlls",               -- YAML LSP

    -- Scripting/Interpreted
	"pyright",              -- Python LSP
    "omnisharp",            -- C#
    -- "gdscript",             -- Godot Scripting Language

    -- Compiled
	"clangd",               -- C/C++ LSP
    "gopls",                -- Go LSP & Formatting

    -- Language Management
	"cmake",                -- CMake LSP

    -- By & For Stupid People
    "html",                 -- HTML LSP
    "cssls",                -- CSS LSP
    "tsserver",             -- Typescript & Javascript LSP
    "eslint",               -- Typescript & Javascript Linting
}

return M

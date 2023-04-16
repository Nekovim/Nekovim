local M = {}

M.servers = {
	"lua_ls",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"clangd",
	"cmake",
	-- Uncomment if you don't have rust analyzer installed on your system some other way.
	--"rust_analyzer",
}

return M

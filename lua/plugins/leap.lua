local M = {
	"ggandor/leap.nvim",
	lazy = false,
}

function M.config()
	require("leap").add_default_mappings()
end

return M

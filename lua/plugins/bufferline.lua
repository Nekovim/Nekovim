local M = {
	"akinsho/bufferline.nvim",
	-- event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	dependencies = {
		{
			"famiu/bufdelete.nvim",
		},
	},
}

M.opts = {
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
	},
}

function M.config()
    M.opts.highlights = require("rose-pine.plugins.bufferline")
    require("bufferline").setup(M.opts)
end

return M

local M = {
	"akinsho/bufferline.nvim",
	commit = "c7492a76ce8218e3335f027af44930576b561013",
	event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	dependencies = {
		{
			"famiu/bufdelete.nvim",
			commit = "8933abc09df6c381d47dc271b1ee5d266541448e",
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

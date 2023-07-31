local M = {
	"NMAC427/guess-indent.nvim",
	lazy = false,
}

M.opts = {
	override_editorconfig = false,
	filetype_exclude = {
		"netrw",
		"tutor",
		"edgy",
		"qf",
		"terminal",
		"Trouble",
		"notify",
		"neo-tree",
		"NvimTree",
	},
	buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
		"help",
		"nofile",
		"terminal",
		"prompt",
	},
}

return M

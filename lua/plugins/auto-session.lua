local M = {
	"rmagatti/auto-session",
	branch = "merge-session-lens",
	event = "VimEnter",
}

M.opts = {
	log_level = vim.log.levels.ERROR,
	auto_session_enabled = false,
	auto_save_enabled = false,
	auto_session_supress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	auto_session_use_git_branch = false,
	auto_session_enable_last_session = false,

	session_lens = {
		theme_conf = { border = true },
		previewer = false,
	},
}

M.config = function()
	require("auto-session").setup(M.opts)
end

return M

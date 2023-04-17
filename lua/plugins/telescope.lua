local M = {
	"nvim-telescope/telescope.nvim",
	commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"ahmedkhalf/project.nvim",
			commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
		},
		{
			"nvim-telescope/telescope-file-browser.nvim",
			commit = "e0fcb12",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
}

local actions = require("telescope.actions")

M.opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,

				["<C-n>"] = actions.move_selection_next,
				["<C-e>"] = actions.move_selection_previous,

				["<PageDown>"] = actions.preview_scrolling_up,
				["<PageUp>"] = actions.preview_scrolling_down,
				["<C-PageDown>"] = actions.cycle_history_next,
				["<C-PageUp>"] = actions.cycle_history_prev,

				["<C-u>"] = actions.close,
				["<Esc>"] = actions.close,
			},
			n = {
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,

				["n"] = actions.move_selection_next,
				["e"] = actions.move_selection_previous,

				["<PageDown>"] = actions.preview_scrolling_up,
				["<PageUp>"] = actions.preview_scrolling_down,
				["<C-PageDown>"] = actions.cycle_history_next,
				["<C-PageUp>"] = actions.cycle_history_prev,

				["gg"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.close,
				["<Esc>"] = actions.close,
			},
		},
	},

	extensions = {
		file_browser = {
			mappings = {
				i = {
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,

					["<C-n>"] = actions.move_selection_next,
					["<C-e>"] = actions.move_selection_previous,

					["<PageDown>"] = actions.preview_scrolling_up,
					["<PageUp>"] = actions.preview_scrolling_down,
					["<C-PageDown>"] = actions.cycle_history_next,
					["<C-PageUp>"] = actions.cycle_history_prev,

					["<C-u>"] = actions.close,
					["<Esc>"] = actions.close,
				},
				n = {
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,

					["n"] = actions.move_selection_next,
					["e"] = actions.move_selection_previous,

					["<PageDown>"] = actions.preview_scrolling_up,
					["<PageUp>"] = actions.preview_scrolling_down,
					["<C-PageDown>"] = actions.cycle_history_next,
					["<C-PageUp>"] = actions.cycle_history_prev,

					["gg"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["G"] = actions.move_to_bottom,

					["<C-u>"] = actions.close,
					["<Esc>"] = actions.close,
				},
			},

			hijack_netrw = true,
		},
	},
}

function M.config()
	require("telescope").setup(M.opts)
	require("telescope").load_extension("file_browser")
end

return M

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
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
})

telescope.load_extension("file_browser")

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<Right>"] = actions.cycle_history_next,
        ["<Left>"] = actions.cycle_history_prev,
				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-e>"] = actions.move_selection_previous,

        ["<C-m>"] = actions.cycle_history_next,
				["<C-i>"] = actions.cycle_history_prev,


        ["<PageDown>"] = actions.preview_scrolling_up,
			  ["<PageUp>"] = actions.preview_scrolling_down,

			 	["<C-PageDown>"] = actions.results_scrolling_up,
			 	["<C-PageUp>"] = actions.results_scrolling_down,

        ["<C-u>"] = actions.close,
				["<esc>"] = actions.close,
      },
			n = {
				["<CR>"] = actions.select_default,
				["o"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
				["n"] = actions.move_selection_next,
				["e"] = actions.move_selection_previous,

				["gg"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["G"] = actions.move_to_bottom,

        ["<PageDown>"] = actions.preview_scrolling_up,
			  ["<PageUp>"] = actions.preview_scrolling_down,

			 	["<C-PageDown>"] = actions.results_scrolling_up,
			 	["<C-PageUp>"] = actions.results_scrolling_down,

        ["<esc>"] = actions.close,

				["?"] = actions.which_key,
			},
    },
  },

  extensions = {
    file_browser = {
      -- theme = "ivy",
      hijack_netrw = true,
      mappings = {
        i = {
			    ["<CR>"] = actions.select_default,
			  	["<C-x>"] = actions.select_horizontal,
			  	["<C-v>"] = actions.select_vertical,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<Right>"] = actions.cycle_history_next,
          ["<Left>"] = actions.cycle_history_prev,
			  	["<Tab>"] = actions.move_selection_next,
			  	["<S-Tab>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-e>"] = actions.move_selection_previous,

          ["<C-m>"] = actions.cycle_history_next,
			  	["<C-i>"] = actions.cycle_history_prev,

          ["<PageDown>"] = actions.preview_scrolling_up,
			  	["<PageUp>"] = actions.preview_scrolling_down,

			  	["<C-PageDown>"] = actions.results_scrolling_up,
			  	["<C-PageUp>"] = actions.results_scrolling_down,

          ["<C-u>"] = actions.close,
			  	["<esc>"] = actions.close,
        },
			  n = {
			  	["<CR>"] = actions.select_default,
			  	["o"] = actions.select_default,
			  	["<C-x>"] = actions.select_horizontal,
			  	["<C-v>"] = actions.select_vertical,

			  	["<Down>"] = actions.move_selection_next,
			  	["<Up>"] = actions.move_selection_previous,
			  	["<Tab>"] = actions.move_selection_next,
			  	["<S-Tab>"] = actions.move_selection_previous,
			  	["n"] = actions.move_selection_next,
			  	["e"] = actions.move_selection_previous,

			  	["gg"] = actions.move_to_top,
			  	["M"] = actions.move_to_middle,
			  	["G"] = actions.move_to_bottom,

			  	["<PageDown>"] = actions.preview_scrolling_up,
			  	["<PageUp>"] = actions.preview_scrolling_down,

			  	["<C-PageDown>"] = actions.results_scrolling_up,
			  	["<C-PageUp>"] = actions.results_scrolling_down,

          ["<esc>"] = actions.close,

			  	["?"] = actions.which_key,
			  },
      },
    },
  },
}

telescope.load_extension "file_browser"

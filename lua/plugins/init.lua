return {
	{
		"moll/vim-bbye",
		commit = "25ef93a",
		cmd = { "Bdelete" },
	},

	--[[
      THEMES
    --]]

	-- TOKYONIGHT
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
	},
	-- CATPPUCCIN
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,

		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = { "italic" },
				strings = { "italic" },
				variables = {},
				numbers = {},
				booleans = { "italic" },
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				neotree = true,
				telescope = false,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				mason = true,
				which_key = true,
				notify = false,
				mini = false,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		}, -- make sure we load this during startup if it is your main colorscheme

		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
    {
        "sophacles/vim-processing",
        ft = { "processing", "pde" },
    },
}

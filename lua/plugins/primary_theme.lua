local M = {
	"NiamhFerns/rose-pine.nvim",
	dir = "/home/niamh/Repos/forks/neovim/rose-pine.nvim/",
	name = "rose-pine",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
}

M.opts = {
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = "auto",
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,

	respect_default_highlight_groups = true,
	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		-- Editor
		CursorLine = { bg = "foam", blend = 10 },

		Keyword = { italic = true },
		Function = { italic = false },
		String = { italic = true },
		Boolean = { italic = true },
		Conditional = { italic = true },
		Repeat = { italic = true },
		["@variable"] = { italic = false },
		["@parameter"] = { italic = true },
		["@property"] = { italic = false },

		-- Transparent Telescope
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	},
}

-- Name of the primary theme.
M.config = function(_, opts)
	require("rose-pine").setup(opts)
	local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
	if not status_ok then
		return
	end
end

return M

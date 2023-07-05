local M = {
	"nvim-neorg/neorg",
    lazy = false,
	event = "VimEnter",
	build = ":Neorg sync-parsers",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
		},
	},
}

M.opts = {
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					code = "~/Repos/programming-notes/",
					writing = "~/Repos/personal/non-code_related/writing/",
				},
			},
		},
		["core.keybinds"] = {
			config = { -- Custom User Keybinds
				default_keybinds = true,
				neorg_leader = "<leader>n",
			},
		},
	},
}

function M.config()
	require("neorg").setup(M.opts)
end

return M

M = {
	"folke/zen-mode.nvim",
    cmd = {"ZenMode"}
}

M.opts = {
	window = {
		backdrop = 0.7,
		width = 120,
		height = 1,
		options = {
			signcolumn = "no", -- disable signcolumn
			-- number = false, -- disable number column
			-- relativenumber = false, -- disable relative numbers
			-- cursorline = false, -- disable cursorline
			-- cursorcolumn = false, -- disable cursor column
			-- foldcolumn = "0", -- disable fold column
			-- list = false, -- disable whitespace characters
		},
	},

    plugins = {
        twilight = { enabled = false },
        gitsigns = { enabled = false },
        kitty = {
            enabled = false,
            font = "+3",
        },
    },

    on_open = function(win)
        SetWrapped()
    end
}

return M

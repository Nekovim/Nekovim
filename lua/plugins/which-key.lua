local M = {
	"folke/which-key.nvim",
	commit = "5224c261825263f46f6771f1b644cae33cd06995",
	event = "VeryLazy",
}

function M.config()
	local setup = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		-- operators = { gc = "Comments" },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			["<space>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-n>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		window = {
			border = "rounded", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specify a list manuallyneovim call local lua function from keymapping
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "j", "k" },
			v = { "j", "k" },
		},
	}

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymapsneovim call local lua function from keymapping
		nowait = true, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["<leader>"] = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Fuzzy Find" },
		["."] = {
			"<cmd>Telescope file_browser theme=ivy<cr>",
			"File Browser",
		},

		b = {
			name = "Buffer",
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Search Buffers",
			},
			c = { "<cmd>Bdelete<cr>", "Close Buffer" },
			k = { "<cmd>Bdelete!<cr>", "Kill Buffer" },
			n = { "<cmd>bnext<cr>", "Next Buffer" },
			p = { "<cmd>bprevious<cr>", "Previous Buffer" },
		},

		d = {
			name = "Debug",
			b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
			c = { "<cmd>DapContinue<cr>", "Run Dap" },
			i = { "<cmd>DapStepInto<cr>", "Step Into" },
			l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
			o = { "<cmd>DapStepOver<cr>", "Step Over" },
			q = { "<cmd>DapTerminate<cr>", "Terminate" },
			t = { "<cmd>lua require'dapui'.toggle({reset = true})<CR>", "Toggle UI" },
			r = { "<cmd>DapToggleRepl<CR>", "Toggle Repl" },
			x = { "<cmd>DapStepOut<cr>", "Step Out" },
		},

		f = {
			name = "File",
			f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
			p = { "<cmd>:cd $HOME/.config/nvim<CR>", "Personal Config" },
			s = { "<cmd>:w<CR>", "Save" },
		},

		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = {
				"<cmd>Gitsigns diffthis HEAD<cr>",
				"Diff",
			},
			g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			t = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle Gitsigns" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
		},

		h = {
			name = "Help",
			-- l = {
			-- 	name = "Lazy",
			-- c = { "<cmd><cr>", "Compile" },
			-- i = { "<cmd><cr>", "Install" },
			-- s = { "<cmd><cr>", "Sync" },
			-- S = { "<cmd><cr>", "Status" },
			-- u = { "<cmd><cr>", "Update" },
			-- },
			t = {
				name = "Theme",
				["."] = { "<cmd>Telescope colorscheme theme=dropdown<cr>", "Find Theme" },
				c = { "<cmd>colorscheme catppuccin<cr>", "Catppuccin" },
				r = { "<cmd>colorscheme rose-pine<cr>", "Rose Pine" },
				t = { "<cmd>colorscheme tokyonight-night<cr>", "Tokyo Night" },
			},
		},

		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			k = {
				"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
				"Prev Diagnostic",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			I = { "<cmd>Mason<cr>", "Installer Info" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},

		p = {
			name = "Project",
			h = { "<cmd>cd %:h<cr>", "CD Here" },
			p = { "<cmd>Telescope projects theme=dropdown previewer=false<cr>", "Open Project" },
			r = { "<cmd>ProjectRoot<cr>", "Set as Project Root" },
		},

		q = {
			name = "Quit",
			q = { "<cmd>quitall<cr>", "quit" },
			Q = { "<cmd>qa!<cr>", "Force Quit" },
		},

		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			g = { "<cmd>Telescope live_grep<cr>", "Grep" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
		},

		t = {
			name = "Toggle",
			d = { "<cmd>set background=dark<cr>", "Set Dark Mode" },
			l = { "<cmd>set background=light<cr>", "Set Light Mode" },
			m = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview" },
			t = { "<cmd>Twilight<cr>", "Toggle Twilight" },
			e = { "<cmd>NeoTreeFocusToggle<cr>", "Toggle Neotree" },
			w = { "<cmd>lua SetWrapped()<CR>", "Set Wrapped Mode" },
			E = { "<cmd>NeoTreeShowToggle<cr>", "Show Neotree" },
			W = { "<cmd>lua UnsetWrapped()<CR>", "Unset Wrapped Mode" },
			z = {
				name = "Zen Mode",
				a = { "<cmd>TZAtaraxis<cr>", "Ataraxis" },
				f = { "<cmd>TZFocus<cr>", "Focus" },
				m = { "<cmd>TZMinimalist<cr>", "Minimalist" },
				n = { "<cmd>TZNarrow<cr>", "Narrow" },
			},
		},

        w = {
			name = "Window",
			c = { "<cmd>q<cr>", "Close Window" },
			e = { "<C-w>k", "Close Up" },
			i = { "<C-w>l", "Close Right" },
			k = { "<cmd>q!<cr>", "Kill Window" },
			m = { "<C-w>h", "Focus Left" },
			n = { "<C-w>j", "Focus Down" },
		},

		["<C-/>"] = { "<cmd>nohlsearch<CR>", "Clear Search Highlight" },
	}

	require("which-key").setup(setup)
	require("which-key").register(mappings, opts)
end

return M

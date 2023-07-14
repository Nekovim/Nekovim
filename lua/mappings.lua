local M = {}

-- Which-key bindings registered by which-key.lua.
M.which_key = {
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
		["."] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
		["/"] = { "<cmd>lua require('dap').clear_breakpoints()<cr>", "Clear Breakpoint" },
		c = { "<cmd>DapContinue<cr>", "Run Dap" },
		i = { "<cmd>DapStepInto<cr>", "Step Into" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
		o = { "<cmd>DapStepOver<cr>", "Step Over" },
		q = { "<cmd>DapTerminate<cr><cmd>lua require('dapui').close()<cr>", "Terminate" },
		t = { "<cmd>lua require'dapui'.toggle({reset = true})<CR>", "Toggle UI" },
		r = { "<cmd>DapToggleRepl<CR>", "Toggle Repl" },
		x = { "<cmd>DapStepOut<cr>", "Step Out" },
	},

	f = {
		name = "File",
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		s = { "<cmd>:w<CR>", "Save" },
	},

	g = {
		name = "Git",
		B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Gitblame" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
		g = { "<cmd><cr>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		S = { "<cmd>Neotree float git_status<cr>", "Open Neotree Git Status" },
		t = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle Gitsigns" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
	},

	h = {
		name = "Help & Settings",
		t = { "<cmd>Telescope help_tags<cr>", "Tags" },
		T = {
			name = "Theme",
			["."] = { "<cmd>Telescope colorscheme theme=dropdown<cr>", "Find Theme" },
			["<C-d>"] = { "<cmd>set background=dark<cr>", "Set Dark Mode" },
			["<C-l>"] = { "<cmd>set background=light<cr>", "Set Light Mode" },
			c = { "<cmd>colorscheme catppuccin<cr>", "Catppuccin" },
			r = { "<cmd>colorscheme rose-pine<cr>", "Rose Pine" },
			t = { "<cmd>colorscheme tokyonight-night<cr>", "Tokyo Night" },
		},
		p = { "<cmd>:cd $HOME/.config/nvim<CR>", "Personal Config" },
	},

	n = {
		name = "Neorg Mode",
		["<leader>"] = { "<cmd>Neorg index<CR>", "Default Workspace" },
		["<BS>"] = { "<cmd>Neorg return<CR>", "Return" },
		["."] = { "<cmd>Telescope neorg switch_workspace<CR>", "Switch Workspace" },
		o = {
			name = "Open",
			c = { "<cmd>Neorg workspace code<CR>", "Code Notes" },
			g = { "<cmd>Neorg workspace game<CR>", "Gamedev Notes" },
			l = { "<cmd>Neorg workspace linux<CR>", "Linux Notes" },
			u = { "<cmd>Neorg workspace university<CR>", "University Notes" },
			w = { "<cmd>Neorg workspace writing<CR>", "Writing" },
		},
	},

	p = {
		name = "Projects & Sessions",
		a = { "<cmd>!mkdir .nvimproj<cr>", "Add Project" },
		g = { "<cmd>lua vim.print('Not yet implemented.')<cr>", "View General Sessions" },
		G = { "<cmd>lua vim.print('Not yet implemented.')<cr>", "Save General Session" },
		p = { "<cmd>Telescope projects theme=dropdown previewer=false<cr>", "Open Project" },
		r = { "<cmd>ProjectRoot<cr>", "Set as Project Root" },
		s = { "<cmd>lua vim.print('Not yet implemented.')<cr>", "View Project Sessions" },
		S = { "<cmd>lua vim.print('Not yet implemented.')<cr>", "Save Project Session" },
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
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
	},

	t = {
		name = "Toggle",
		c = { "<cmd>lua require('cmp').setup.buffer { enabled = false }<cr>", "Auto-Completions" },
		l = { "<cmd>set colorcolumn=121<cr>", "Linewrap Indicator" },
		t = { "<cmd>Twilight<cr>", "Twilight" },
		e = { "<cmd>NeoTreeFocusToggle<cr>", "Neotree" },
		w = { "<cmd>lua ToggleWrapped()<CR>", "Wrapped Mode" },
		E = { "<cmd>NeoTreeShowToggle<cr>", "Show Neotree" },
		z = { "<cmd>ZenMode<cr>", "Zen Mode" },
		-- z = {
		-- 	name = "Zen Mode",
		-- 	a = { "<cmd>TZAtaraxis<cr>", "Ataraxis" },
		-- 	f = { "<cmd>TZFocus<cr>", "Focus" },
		-- 	m = { "<cmd>TZMinimalist<cr>", "Minimalist" },
		-- 	n = { "<cmd>TZNarrow<cr>", "Narrow" },
		-- },
	},

	v = {
		name = "View",
		l = { "<cmd>Lazy<cr>", "Lazy UI" },
		i = { "<cmd>LspInfo<cr>", "LSP Info" },
		m = { "<cmd>Mason<cr>", "Mason UI" },
		t = {
			name = "Theme",
			["."] = { "<cmd>Telescope colorscheme theme=dropdown<cr>", "Find Theme" },
			c = { "<cmd>colorscheme catppuccin<cr>", "Catppuccin" },
			r = { "<cmd>colorscheme rose-pine<cr>", "Rose Pine" },
			t = { "<cmd>colorscheme tokyonight-night<cr>", "Tokyo Night" },
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

-- Mappings for Neorg mode (Only visible in Neorg mode).
-- NOTE: These are only the labels. You need to change these in neorg.lua ["core.keybinds"] for them to take effect.
M.neorg_leader = "<leader>n"

-- Callback used to bind keys when entering neorg buffer. Can't be done directly through which-key.
M.neorg_bindings = function(keybinds)
	-- View Table of Contents
	keybinds.remap_key("norg", "n", "<C-Space>", "<C-cr>")
	keybinds.map("all", "n", "<leader>n<C-/>", "<cmd>:Neorg toc qflist<CR>")

	-- Telescope Find Neorg Files
	keybinds.map("all", "n", "<leader><leader>", "<cmd>:Telescope neorg find_norg_files<CR>")
	keybinds.map("all", "n", "<leader>n,", "<cmd>:Telescope neorg search_headings<CR>")

	-- Telescope Insert Normal Link
	keybinds.map("norg", "n", "<leader>nil", "<cmd>:Telescope neorg insert_link<CR>")
	keybinds.map("norg", "i", "<C-.>l", "<cmd>:Telescope neorg insert_link<CR>")

	-- Telescope Insert File Link
	keybinds.map("norg", "n", "<leader>nif", "<cmd>:Telescope neorg insert_file_link<CR>")
	keybinds.map("norg", "i", "<C-.>f", "<cmd>:Telescope neorg insert_file_link<CR>")

	-- Open Code Looking Glass
	keybinds.remap_event("all", "n", "<leader>nvl", "core.looking-glass.magnify-code-block")
	keybinds.remap_event("all", "i", "<C-.><cr>", "core.looking-glass.magnify-code-block")

	-- Insert Meta Data
	keybinds.map("norg", "n", "<leader>nim", "<cmd>:Neorg inject-metadata<CR>")
end

M.neorg_labels = {
	n = {
		name = "Neorg Mode",
		[","] = { "Find Heading" },
		["<C-/>"] = { "Open Table of Contents" },
		i = {
			name = "Insert",
			d = { "Date" },
			f = { "File Link" },
			l = { "Link" },
			m = { "Meta Data" },
		},
		l = {
			name = "List",
			i = { "Invert" },
			t = { "Toggle (Un)ordered" },
		},
		m = {
			name = "Mode",
			h = { "Enter Heading Traversal Mode" },
			n = { "Enter Neorg Mode" },
		},
		n = {
			name = "Note",
			n = { "New Note" },
		},
		t = {
			name = "Task",
			a = { "Mark Ambiguous" },
			c = { "Mark Cancelled" },
			d = { "Mark Done" },
			h = { "Mark On Hold" },
			i = { "Mark Important" },
			p = { "Mark Pending" },
			r = { "Mark Recurring" },
			u = { "Mark Undone" },
		},
		v = {
			name = "View",
			l = { "Looking Glass" },
		},
	},
}

-- LSP Mappings to be registered with which-key.
M.lsp = {
	c = {
		name = "Code Actions",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Declaration" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Definition" },
		e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "View Line Diagnostics" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "View Implementations" },
		n = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic" },
		p = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous Diagnistoc" },
		q = { "<cmd>lua vim.lsp.diagnostic.setloclist<cr>", "QuickFix" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "View References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		-- s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature_help()" },
	},

	r = {
		name = "Refactor",
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	},
}

-- Quality of life changes to default bindings.
M.set_qol = function()
	local noremap = { silent = true, noremap = true }
	local term_opts = { silent = true }
	local keymap = vim.keymap.set

	keymap("", "<Space>", "<Nop>", noremap)
	vim.g.mapleader = " "
	vim.g.maplocalleader = ","

	-- Normal --
	-- Better window navigation
	keymap("n", "<leader>wm", "<C-w>h", noremap)
	keymap("n", "<leader>wn", "<C-w>j", noremap)
	keymap("n", "<leader>we", "<C-w>k", noremap)
	keymap("n", "<leader>wi", "<C-w>l", noremap)

	-- Resize with arrows
	keymap("n", "<C-Up>", ":resize +2<CR>", noremap)
	keymap("n", "<C-Down>", ":resize -2<CR>", noremap)
	keymap("n", "<C-Left>", ":vertical resize -2<CR>", noremap)
	keymap("n", "<C-Right>", ":vertical resize +2<CR>", noremap)

	-- Better scrolling
	keymap("n", "<C-n>", "<C-e>", noremap)
	keymap("n", "<C-e>", "<C-y>", noremap)
	keymap("n", "<C-k>", "<C-d>", noremap)
	keymap("n", "<C-j>", "<C-u>", noremap)

	-- Insert --
	-- Easier Escape sequence.
	keymap("n", "<C-u>", "<ESC>", noremap)
	keymap("i", "<C-u>", "<ESC>", noremap)
	keymap("v", "<C-u>", "<ESC>", noremap)

	-- Visual --
	-- Stay in indent mode
	keymap("v", "<", "<gv", noremap)
	keymap("v", ">", ">gv", noremap)

	-- Move text up and down
	keymap("v", "<A-n>", ":m .+1<CR>==", noremap)
	keymap("v", "<A-e>", ":m .-2<CR>==", noremap)
	keymap("v", "p", '"_dP', noremap)

	-- Visual Block --
	-- Move text up and down
	keymap("x", "N", ":move '>+1<CR>gv-gv", noremap)
	keymap("x", "E", ":move '<-2<CR>gv-gv", noremap)
	keymap("x", "<A-n>", ":move '>+1<CR>gv-gv", noremap)
	keymap("x", "<A-e>", ":move '<-2<CR>gv-gv", noremap)

	-- Terminal --
	-- Better terminal navigation
	keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
	keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
	keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
	keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

	-- Other Unsorted Junk
	keymap("n", "<leader>qq", ":qa<CR>", noremap)
	keymap("n", "<leader>qQ", ":qa!<CR>", noremap)

	keymap("n", "<C-/>", ":nohlsearch<CR>", noremap)
	keymap("i", "<C-/>", ":nohlsearch<CR>", noremap)
end

-- Colemak bindings.
M.set_colemak = function()
	local noremap = { noremap = true, silent = true }
	local keymap = vim.api.nvim_set_keymap

	-- NORMAL MODE --
	-- Movement Keys
	keymap("n", "m", "h", noremap)
	keymap("n", "M", "H", noremap)
	keymap("n", "n", "j", noremap)
	keymap("n", "N", "J", noremap)
	keymap("n", "e", "k", noremap)
	keymap("n", "E", "K", noremap)
	keymap("n", "i", "l", noremap)
	keymap("n", "I", "L", noremap)

	-- Insert and Undo
	keymap("n", "u", "i", noremap)
	keymap("n", "U", "I", noremap)
	keymap("n", "l", "u", noremap)
	keymap("n", "L", "U", noremap)

	-- Rebinding displacedno keys.
	keymap("n", "h", "m", noremap)
	keymap("n", "H", "M", noremap)
	keymap("n", "j", "e", noremap)
	keymap("n", "J", "E", noremap)
	keymap("n", "k", "n", noremap)
	keymap("n", "K", "N", noremap)

	-- INSERT MODE --
	keymap("i", "<c-g>n", "<c-g>j", noremap)
	keymap("i", "<c-g><c-n>", "<c-g><c-j>", noremap)
	keymap("i", "<c-g>e", "<c-g>k", noremap)
	keymap("i", "<c-g><c-e>", "<c-g><c-k>", noremap)

	-- Required due to a bug in Vim 8.
	keymap("i", "<c-g>j", "<c-g>j", noremap)
	keymap("i", "<c-g>k", "<c-g>k", noremap)

	-- VISUAL MODE --
	-- Movement Keys
	keymap("x", "m", "h", noremap)
	keymap("x", "M", "H", noremap)
	keymap("x", "n", "j", noremap)
	keymap("x", "N", "J", noremap)
	keymap("x", "e", "k", noremap)
	keymap("x", "E", "K", noremap)
	keymap("x", "i", "l", noremap)
	keymap("x", "I", "L", noremap)

	-- Insert and Undo
	keymap("x", "u", "i", noremap)
	keymap("x", "U", "I", noremap)
	keymap("x", "l", "u", noremap)
	keymap("x", "L", "U", noremap)

	-- Rebinding displaced keys.
	keymap("x", "h", "m", noremap)
	keymap("x", "H", "M", noremap)
	keymap("x", "j", "e", noremap)
	keymap("x", "J", "E", noremap)
	keymap("x", "k", "n", noremap)
	keymap("x", "K", "N", noremap)

	keymap("n", "n", "gj", noremap)
	keymap("n", "e", "gk", noremap)
end

return M

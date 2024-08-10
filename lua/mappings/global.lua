local M = {}

-- mode = mode or "n", -- NORMAL mode
-- prefix = "<leader>",
-- buffer = bufnr, -- nil for Global mappings
-- silent = true, -- use `silent` when creating keymaps
-- noremap = true, -- use `noremap` when creating keymapsneovim call local lua function from keymapping
-- nowait = true, -- use `nowait` when creating keymaps

M.which_key = {
	---------------------------------------------------------------------------------------------------
	-- NORMAL MODE
	---------------------------------------------------------------------------------------------------
	-- Root Commands
	{
		"<leader><leader>",
		"<cmd>Telescope find_files theme=dropdown previewer=false<cr>",
		desc = "Find File",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>.",
		"<cmd>Telescope file_browser theme=ivy<cr>",
		desc = "File Browser",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>,",
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		desc = "Find Buffer",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>`", "<cmd>:TSJToggle<cr>", desc = "Splitjoin Toggle", nowait = true, remap = false, mode = "n" },
	{
		"<leader><C-/>",
		"<cmd>nohlsearch<CR>",
		desc = "Clear Search Highlight",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Harpoon
	{ "<leader>/", group = "Harpoon" },
	{
		"<leader>/<leader>",
		"<cmd>Telescope harpoon marks<cr>",
		desc = "Search Marks",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/a",
		"<cmd>lua require('harpoon.mark').add_file()<cr>",
		desc = "Add Mark",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/n",
		"<cmd>lua require('harpoon.ui').nav_next()<cr>",
		desc = "Next Mark",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/e",
		"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
		desc = "Previous Mark",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/1",
		"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
		desc = "Mark 1",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/2",
		"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
		desc = "Mark 2",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/3",
		"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
		desc = "Mark 3",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/4",
		"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
		desc = "Mark 4",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/5",
		"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
		desc = "Mark 5",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/6",
		"<cmd>lua require('harpoon.ui').nav_file(6)<cr>",
		desc = "Mark 6",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/7",
		"<cmd>lua require('harpoon.ui').nav_file(7)<cr>",
		desc = "Mark 7",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/8",
		"<cmd>lua require('harpoon.ui').nav_file(8)<cr>",
		desc = "Mark 8",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/9",
		"<cmd>lua require('harpoon.ui').nav_file(9)<cr>",
		desc = "Mark 9",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"leader/0",
		"<cmd>lua require('harpoon.ui').nav_file(0)<cr>",
		desc = "Mark 0",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Buffer
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bc", "<cmd>Bdelete<cr>", desc = "Close Buffer", nowait = true, remap = false, mode = "n" },
	{ "<leader>bk", "<cmd>Bdelete!<cr>", desc = "Kill Buffer", nowait = true, remap = false, mode = "n" },
	{ "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer", nowait = true, remap = false, mode = "n" },
	{ "<leader>bN", "<cmd>:ene <Bar startinsert <cr>", desc = "New File", nowait = true, remap = false, mode = "n" },
	{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer", nowait = true, remap = false, mode = "n" },
	{ "<leader>br", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", nowait = true, remap = false, mode = "n" },
	{ "<leader>bs", "<cmd>:w<CR>", desc = "Save Buffer", nowait = true, remap = false, mode = "n" },

	-- Edgy
	{ "<leader>e", group = "Edgy", nowait = true, remap = false, mode = "n" },
	{
		"<leader>e<CR>",
		"<cmd>lua require('edgy').open('left')<cr>",
		desc = "Open Left",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>e<BS>",
		"<cmd>lua require('edgy').close('left')<cr>",
		desc = "Close Left",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>eL",
		"<cmd>SymbolsOutlineOpen<cr><cmd>Neotree show<cr><cmd>Neotree buffers<cr>",
		desc = "Open All Left Panels",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>eb",
		"<cmd>Neotree buffers<cr>",
		desc = "Neotree Buffers",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>ed",
		"<cmd>Trouble<cr>",
		desc = "Trouble Diagnostics",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>eg",
		"<cmd>Neotree git_status<cr>",
		desc = "Neotree Git Status",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>eN", "<cmd>Neotree toggle<cr>", desc = "Neotree", nowait = true, remap = false, mode = "n" },
	{ "<leader>en", "<cmd>Neotree focus<cr>", desc = "Neotree", nowait = true, remap = false, mode = "n" },
	{
		"<leader>eo",
		"<cmd>SymbolsOutline<cr>",
		desc = "Symbols Outline",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Git
	{ "<leader>g", group = "Git", nowait = true, remap = false, mode = "n" },
	{ "<leader>g.", "<cmd>LazyGit<cr>", desc = "LazyGit Toggle", nowait = true, remap = false, mode = "n" },
	{
		"<leader>g<leader>",
		"<cmd>LazyGitFilter<cr>",
		desc = "Current Project Commits",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gB",
		"<cmd>Gitsigns toggle_current_line_blame<cr>",
		desc = "Gitblame",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gb",
		"<cmd>Telescope git_branches<cr>",
		desc = "Checkout branch",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gc",
		"<cmd>Telescope git_commits<cr>",
		desc = "Checkout commit",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false, mode = "n" },
	{
		"<leader>ge",
		"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
		desc = "Prev Hunk",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>go",
		"<cmd>Telescope git_status<cr>",
		desc = "Open changed file",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gp",
		"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
		desc = "Preview Hunk",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gn",
		"<cmd>lua require 'gitsigns'.next_hunk()<cr>",
		desc = "Next Hunk",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gr",
		"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
		desc = "Reset Hunk",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gR",
		"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
		desc = "Reset Buffer",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gs",
		"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
		desc = "Stage Hunk",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gt",
		"<cmd>Gitsigns toggle_signs<cr>",
		desc = "Toggle Gitsigns",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>gu",
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		desc = "Undo Stage Hunk",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Help
	{ "<leader>h", group = "Help & Settings", nowait = true, remap = false, mode = "n" },
	{ "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "Tags", nowait = true, remap = false, mode = "n" },
	{
		"<leader>hc",
		"<cmd>:e" .. vim.fn.stdpath("config") .. "/init.lua<CR>",
		desc = "Personal Config",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Help -> Theme
	{ "<leader>hT", group = "Themes", nowait = true, remap = false, mode = "n" },
	{
		"<leader>hT.",
		"<cmd>Telescope colorscheme theme=dropdown<cr>",
		desc = "Find Theme",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>hT<C-d>",
		"<cmd>set background=dark<cr>",
		desc = "Set Dark Mode",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>hT<C-l>",
		"<cmd>set background=light<cr>",
		desc = "Set Light Mode",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>hTc", "<cmd>colorscheme catppuccin<cr>", desc = "Catppuccin", nowait = true, remap = false, mode = "n" },
	{ "<leader>hTr", "<cmd>colorscheme rose-pine<cr>", desc = "Rose Pine", nowait = true, remap = false, mode = "n" },
	{
		"<leader>hTt",
		"<cmd>colorscheme tokyonight-night<cr>",
		desc = "Tokyo Night",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Move
	{ "<leader>m", group = "Move", nowait = true, remap = false, mode = "n" },
	{ "<leader>me", "<C-o>", desc = "Jumplist Up", nowait = true, remap = false, mode = "n" },
	{ "<leader>mn", "<C-i>", desc = "Jumplist Down", nowait = true, remap = false, mode = "n" },

	-- Neorg Mode
	{ "<leader>n", group = "Neorg Mode", nowait = true, remap = false, mode = "n" },
	{
		"<leader>n<leader>",
		"<cmd>Neorg index<CR>",
		desc = "Default Workspace",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>n<BS>", "<cmd>Neorg return<CR>", desc = "Return", nowait = true, remap = false, mode = "n" },
	{
		"<leader>n.",
		"<cmd>Telescope neorg switch_workspace<CR>",
		desc = "Switch Workspace",
		nowait = true,
		remap = false,
		mode = "n",
	},

	-- Projects & Sessions
	{ "<leader>p", group = "Projects & Sessions", nowait = true, remap = false, mode = "n" },
	{
		"<leader>p<CR>",
		"<cmd>lua require('persistence').save()<cr>",
		desc = "Save Session",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>p<BS>",
		"<cmd>lua require('persistence').load({ last = true })<cr>",
		desc = "Load Last Session",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>p.",
		"<cmd>Telescope projects theme=dropdown previewer=false<cr>",
		desc = "Open Project",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>p/", "<cmd>!mkdir .nvimproj<cr>", desc = "Add Project" },

	-- Search
	{ "<leader>s", group = "Search", nowait = true, remap = false, mode = "n" },
	{
		"<leader>sb",
		"<cmd>Telescope git_branches<cr>",
		desc = "Checkout branch",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false, mode = "n" },
	{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep", nowait = true, remap = false, mode = "n" },
	{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false, mode = "n" },
	{ "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false, mode = "n" },
	{
		"<leader>sr",
		"<cmd>Telescope oldfiles<cr>",
		desc = "Open Recent File",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false, mode = "n" },

	-- Toggle
	{ "<leader>t", group = "Toggle", nowait = true, remap = false, mode = "n" },
	{
		"<leader>tc",
		"<cmd>lua require('cmp').setup.buffer { enabled = false }<cr>",
		desc = "Auto-Completions",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{
		"<leader>tl",
		"<cmd>set colorcolumn=121<cr>",
		desc = "Linewrap Indicator",
		nowait = true,
		remap = false,
		mode = "n",
	},
	{ "<leader>tT", "<cmd>Twilight<cr>", desc = "Twilight", nowait = true, remap = false, mode = "n" },
	{ "<leader>tw", "<cmd>lua ToggleWrapped()<CR>", desc = "Wrapped Mode", nowait = true, remap = false, mode = "n" },
	{ "<leader>tz", "<cmd>ZenMode<cr>", desc = "Zen Mode", nowait = true, remap = false, mode = "n" },

	-- View
	{ "<leader>v", group = "View", nowait = true, remap = false, mode = "n" },
	{ "<leader>vg", "<cmd>ChatGPT<cr>", desc = "ChatGPT", nowait = true, remap = false, mode = "n" },
	{ "<leader>vl", "<cmd>Lazy<cr>", desc = "Lazy UI", nowait = true, remap = false, mode = "n" },
	{ "<leader>vi", "<cmd>LspInfo<cr>", desc = "LSP Info", nowait = true, remap = false, mode = "n" },
	{ "<leader>vm", "<cmd>Mason<cr>", desc = "Mason UI", nowait = true, remap = false, mode = "n" },

	-- Window
	{ "<leader>w", group = "Window", nowait = true, remap = false, mode = "n" },
	{ "<leader>wc", "<cmd>q<cr>", desc = "Close Window", nowait = true, remap = false, mode = "n" },
	{ "<leader>we", "<C-w>k", desc = "Focus Up", nowait = true, remap = false, mode = "n" },
	{ "<leader>wi", "<C-w>l", desc = "Focus Right", nowait = true, remap = false, mode = "n" },
	{ "<leader>wk", "<cmd>q!<cr>", desc = "Kill Window", nowait = true, remap = false, mode = "n" },
	{ "<leader>wm", "<C-w>h", desc = "Focus Left", nowait = true, remap = false, mode = "n" },
	{ "<leader>wn", "<C-w>j", desc = "Focus Down", nowait = true, remap = false, mode = "n" },
	{ "<leader>wq", "<cmd>quitall<cr>", desc = "Quit Neovim", nowait = true, remap = false, mode = "n" },
	{ "<leader>wQ", "<cmd>qa!<cr>", desc = "Force Quit", nowait = true, remap = false, mode = "n" },

	---------------------------------------------------------------------------------------------------
	-- INSERT MODE
	---------------------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------------------
	-- VISUAL MODE
	---------------------------------------------------------------------------------------------------
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
	-- Resize with arrows
	keymap("n", "<C-Up>", ":resize +2<CR>", noremap)
	keymap("n", "<C-Down>", ":resize -2<CR>", noremap)
	keymap("n", "<C-Left>", ":vertical resize -2<CR>", noremap)
	keymap("n", "<C-Right>", ":vertical resize +2<CR>", noremap)

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

	keymap("n", "<C-/>", ":nohlsearch<CR>", noremap)
	keymap("i", "<C-/>", ":nohlsearch<CR>", noremap)
end

-- qwerty specific bindings.
M.set_qwerty = function()
	local noremap = { noremap = true, silent = true }
	local keymap = vim.api.nvim_set_keymap

	-- Better scrolling
	keymap("n", "<C-j>", "<C-e>", noremap)
	keymap("n", "<C-k>", "<C-y>", noremap)
	keymap("n", "<C-n>", "<C-d>", noremap)
	keymap("n", "<C-e>", "<C-u>", noremap)

	-- Easier Escape sequence.
	keymap("n", "<C-u>", "<ESC>", noremap)
	keymap("i", "<C-u>", "<ESC>", noremap)
	keymap("v", "<C-u>", "<ESC>", noremap)
end

-- Colemak specific bindings.
M.set_colemak = function()
	local noremap = { noremap = true, silent = true }
	local keymap = vim.api.nvim_set_keymap

	-- Easier Escape sequence.
	keymap("n", "<C-u>", "<ESC>", noremap)
	keymap("i", "<C-u>", "<ESC>", noremap)
	keymap("v", "<C-u>", "<ESC>", noremap)

	-- Better scrolling
	keymap("n", "<C-n>", "<C-e>", noremap)
	keymap("n", "<C-e>", "<C-y>", noremap)
	keymap("n", "<C-k>", "<C-d>", noremap)
	keymap("n", "<C-j>", "<C-u>", noremap)

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

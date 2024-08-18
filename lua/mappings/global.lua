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
    "<leader>/a",
    "<cmd>lua require('harpoon.mark').add_file()<cr>",
    desc = "Add Mark",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/n",
    "<cmd>lua require('harpoon.ui').nav_next()<cr>",
    desc = "Next Mark",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/e",
    "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
    desc = "Previous Mark",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/1",
    "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
    desc = "Mark 1",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/2",
    "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
    desc = "Mark 2",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/3",
    "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
    desc = "Mark 3",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/4",
    "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
    desc = "Mark 4",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/5",
    "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
    desc = "Mark 5",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/6",
    "<cmd>lua require('harpoon.ui').nav_file(6)<cr>",
    desc = "Mark 6",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/7",
    "<cmd>lua require('harpoon.ui').nav_file(7)<cr>",
    desc = "Mark 7",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/8",
    "<cmd>lua require('harpoon.ui').nav_file(8)<cr>",
    desc = "Mark 8",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/9",
    "<cmd>lua require('harpoon.ui').nav_file(9)<cr>",
    desc = "Mark 9",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>/0",
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
  { "<leader>e", group = "Edgy" },
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
  { "<leader>g", group = "Git" },
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
  { "<leader>h", group = "Help & Settings" },
  { "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "Tags", nowait = true, remap = false, mode = "n" },
  {
    "<leader>hc",
    "<cmd>:e " .. vim.fn.stdpath "config" .. "/init.lua<CR>",
    desc = "Personal Config",
    nowait = true,
    remap = false,
    mode = "n",
  },

  -- Help -> Theme
  { "<leader>hT", group = "Themes" },
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
  { "<leader>n", group = "Neorg Mode" },
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
  { "<leader>p", group = "Projects & Sessions" },
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
  { "<leader>s", group = "Search" },
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
  { "<leader>t", group = "Toggle" },
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
  { "<leader>v", group = "View" },
  { "<leader>vg", "<cmd>ChatGPT<cr>", desc = "ChatGPT", nowait = true, remap = false, mode = "n" },
  { "<leader>vl", "<cmd>Lazy<cr>", desc = "Lazy UI", nowait = true, remap = false, mode = "n" },
  { "<leader>vi", "<cmd>LspInfo<cr>", desc = "LSP Info", nowait = true, remap = false, mode = "n" },
  { "<leader>vm", "<cmd>Mason<cr>", desc = "Mason UI", nowait = true, remap = false, mode = "n" },

  -- Window
  { "<leader>w", group = "Window" },
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
  local opts = { silent = true, noremap = true }
  local term_opts = { silent = true }
  local map_key = vim.keymap.set

  map_key("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","

  -- Normal --
  -- Resize with arrows
  map_key("n", "<C-Up>", ":resize +2<CR>", opts)
  map_key("n", "<C-Down>", ":resize -2<CR>", opts)
  map_key("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  map_key("n", "<C-Right>", ":vertical resize +2<CR>", opts)

  -- Visual --
  -- Stay in indent mode
  map_key("v", "<", "<gv", opts)
  map_key("v", ">", ">gv", opts)

  -- Move text up and down
  map_key("v", "<A-n>", ":m .+1<CR>==", opts)
  map_key("v", "<A-e>", ":m .-2<CR>==", opts)
  map_key("v", "p", '"_dP', opts)

  -- Visual Block --
  -- Move text up and down
  map_key("x", "N", ":move '>+1<CR>gv-gv", opts)
  map_key("x", "E", ":move '<-2<CR>gv-gv", opts)
  map_key("x", "<A-n>", ":move '>+1<CR>gv-gv", opts)
  map_key("x", "<A-e>", ":move '<-2<CR>gv-gv", opts)

  -- Terminal --
  -- Better terminal navigation
  map_key("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  map_key("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  map_key("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  map_key("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

  map_key("n", "<C-/>", ":nohlsearch<CR>", opts)
  map_key("i", "<C-/>", ":nohlsearch<CR>", opts)
end

-- qwerty specific bindings.
M.set_qwerty = function()
  local opts = { noremap = true, silent = true }
  local map_key = vim.keymap.set

  -- Better scrolling
  map_key("n", "<C-j>", "<C-e>", opts)
  map_key("n", "<C-k>", "<C-y>", opts)
  map_key("n", "<C-n>", "<C-d>", opts)
  map_key("n", "<C-e>", "<C-u>", opts)

  -- Easier Escape sequence.
  map_key("n", "<C-u>", "<ESC>", opts)
  map_key("i", "<C-u>", "<ESC>", opts)
  map_key("v", "<C-u>", "<ESC>", opts)
end

-- Colemak specific bindings.
M.set_colemak = function()
  local opts = { noremap = true, silent = true }
  local map_key = vim.keymap.set

  -- Easier Escape sequence.
  map_key("n", "<C-u>", "<ESC>", opts)
  map_key("i", "<C-u>", "<ESC>", opts)
  map_key("v", "<C-u>", "<ESC>", opts)

  -- Better scrolling
  map_key("n", "<C-n>", "<C-e>", opts)
  map_key("n", "<C-e>", "<C-y>", opts)
  map_key("n", "<C-k>", "<C-d>", opts)
  map_key("n", "<C-j>", "<C-u>", opts)

  -- NORMAL MODE --
  -- Movement Keys
  map_key("n", "m", "h", opts)
  map_key("n", "M", "H", opts)
  map_key("n", "n", "j", opts)
  map_key("n", "N", "J", opts)
  map_key("n", "e", "k", opts)
  map_key("n", "E", "K", opts)
  map_key("n", "i", "l", opts)
  map_key("n", "I", "L", opts)

  -- Insert and Undo
  map_key("n", "u", "i", opts)
  map_key("n", "U", "I", opts)
  map_key("n", "l", "u", opts)
  map_key("n", "L", "U", opts)

  -- Rebinding displacedno keys.
  map_key("n", "h", "m", opts)
  map_key("n", "H", "M", opts)
  map_key("n", "j", "e", opts)
  map_key("n", "J", "E", opts)
  map_key("n", "k", "n", opts)
  map_key("n", "K", "N", opts)

  -- INSERT MODE --
  map_key("i", "<c-g>n", "<c-g>j", opts)
  map_key("i", "<c-g><c-n>", "<c-g><c-j>", opts)
  map_key("i", "<c-g>e", "<c-g>k", opts)
  map_key("i", "<c-g><c-e>", "<c-g><c-k>", opts)

  -- Required due to a bug in Vim 8.
  map_key("i", "<c-g>j", "<c-g>j", opts)
  map_key("i", "<c-g>k", "<c-g>k", opts)

  -- VISUAL MODE --
  -- Movement Keys
  map_key("x", "m", "h", opts)
  map_key("x", "M", "H", opts)
  map_key("x", "n", "j", opts)
  map_key("x", "N", "J", opts)
  map_key("x", "e", "k", opts)
  map_key("x", "E", "K", opts)
  map_key("x", "i", "l", opts)
  map_key("x", "I", "L", opts)

  -- Insert and Undo
  map_key("x", "u", "i", opts)
  map_key("x", "U", "I", opts)
  map_key("x", "l", "u", opts)
  map_key("x", "L", "U", opts)

  -- Rebinding displaced keys.
  map_key("x", "h", "m", opts)
  map_key("x", "H", "M", opts)
  map_key("x", "j", "e", opts)
  map_key("x", "J", "E", opts)
  map_key("x", "k", "n", opts)
  map_key("x", "K", "N", opts)

  map_key("n", "n", "gj", opts)
  map_key("n", "e", "gk", opts)
end

return M

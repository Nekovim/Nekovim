local M = {}

M.which_key = {
  normal = {
    ["<leader>"] = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find File" },
    ["."] = {
      "<cmd>Telescope file_browser theme=ivy<cr>",
      "File Browser",
    },
    [","] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find Buffer",
    },
    ["`"] = {
      "<cmd>:TSJToggle<cr>",
      "Splitjoin Toggle",
    },
    ["/"] = {
      name = "Harpoon",
      ["<leader>"] = { "<cmd>Telescope harpoon marks<cr>", "Search Marks" },
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
      n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Mark" },
      e = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Mark" },
      ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Mark 1" },
      ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Mark 2" },
      ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Mark 3" },
      ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Mark 4" },
      ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Mark 5" },
      ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Mark 6" },
      ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Mark 7" },
      ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Mark 8" },
      ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Mark 9" },
      ["0"] = { "<cmd>lua require('harpoon.ui').nav_file(0)<cr>", "Mark 0" },
    },
    ["<C-/>"] = { "<cmd>nohlsearch<CR>", "Clear Search Highlight" },

    b = {
      name = "Buffer",
      c = { "<cmd>Bdelete<cr>", "Close Buffer" },
      k = { "<cmd>Bdelete!<cr>", "Kill Buffer" },
      n = { "<cmd>bnext<cr>", "Next Buffer" },
      N = { "<cmd>:ene <Bar startinsert <cr>", "New File" },
      p = { "<cmd>bprevious<cr>", "Previous Buffer" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
      s = { "<cmd>:w<CR>", "Save Buffer" },
    },

    e = {
      name = "Edgy",
      ["<CR>"] = { "<cmd>lua require('edgy').open('left')<cr>", "Open Left" },
      ["<BS>"] = { "<cmd>lua require('edgy').close('left')<cr>", "Close Left" },
      L = { "<cmd>SymbolsOutlineOpen<cr><cmd>Neotree show<cr><cmd>Neotree buffers<cr>", "Open All Left Panels" },
      b = { "<cmd>Neotree buffers<cr>", "Neotree Buffers" },
      d = { "<cmd>Trouble<cr>", "Trouble Diagnostics" },
      g = { "<cmd>Neotree git_status<cr>", "Neotree Git Status" },
      N = { "<cmd>Neotree toggle<cr>", "Neotree" },
      n = { "<cmd>Neotree focus<cr>", "Neotree" },
      o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
    },

    g = {
      name = "Git",
      ["."] = { "<cmd>LazyGit<cr>", "LazyGit Toggle" },
      ["<leader>"] = { "<cmd>LazyGitFilter<cr>", "Current Project Commits" },
      B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Gitblame" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Diff",
      },
      e = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
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

    m = {
      name = "Move",
      e = { "<C-o>", "Jumplist Up" },
      n = { "<C-i>", "Jumplist Down" },
    },

    n = {
      name = "Neorg Mode",
      ["<leader>"] = { "<cmd>Neorg index<CR>", "Default Workspace" },
      ["<BS>"] = { "<cmd>Neorg return<CR>", "Return" },
      ["."] = { "<cmd>Telescope neorg switch_workspace<CR>", "Switch Workspace" },
    },

    p = {
      name = "Projects & Sessions",
      ["<cr>"] = { "<cmd>lua require('persistence').save()<cr>", "Save Session" },
      ["<bs>"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Load Last Session" },
      ["."] = { "<cmd>Telescope projects theme=dropdown previewer=false<cr>", "Open Project" },
      ["/"] = { "<cmd>!mkdir .nvimproj<cr>", "Add Project" },
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
      T = { "<cmd>Twilight<cr>", "Twilight" },
      w = { "<cmd>lua ToggleWrapped()<CR>", "Wrapped Mode" },
      z = { "<cmd>ZenMode<cr>", "Zen Mode" },
    },

    v = {
      name = "View",
      g = { "<cmd>ChatGPT<cr>", "ChatGPT" },
      l = { "<cmd>Lazy<cr>", "Lazy UI" },
      i = { "<cmd>LspInfo<cr>", "LSP Info" },
      m = { "<cmd>Mason<cr>", "Mason UI" },
    },

    w = {
      name = "Window",
      c = { "<cmd>q<cr>", "Close Window" },
      e = { "<C-w>k", "Focus Up" },
      i = { "<C-w>l", "Focus Right" },
      k = { "<cmd>q!<cr>", "Kill Window" },
      m = { "<C-w>h", "Focus Left" },
      n = { "<C-w>j", "Focus Down" },
      q = { "<cmd>quitall<cr>", "Quit Neovim" },
      Q = { "<cmd>qa!<cr>", "Force Quit" },
    },
  },
  insert = {},
  visual = {},
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

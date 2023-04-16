-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local noremap = { silent = true, noremap = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", noremap)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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

-- Insert --
-- Easier Escape sequence.
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

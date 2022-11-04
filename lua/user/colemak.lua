local noremap = { noremap = true, silent = true }
local remap = { noremap = false, silent = true }

local term_opts = { silent = true }

-- Shorten function name.
local keymap = vim.api.nvim_set_keymap

-- MODE
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- vim.cmd "set notimeout"

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

-- Rebinding displaced keys.
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
keymap("v", "m", "h", noremap)
keymap("v", "M", "H", noremap)
keymap("v", "n", "j", noremap)
keymap("v", "N", "J", noremap)
keymap("v", "e", "k", noremap)
keymap("v", "E", "K", noremap)
keymap("v", "i", "l", noremap)
keymap("v", "I", "L", noremap)

-- Insert and Undo
keymap("v", "u", "i", noremap)
keymap("v", "U", "I", noremap)
keymap("v", "l", "u", noremap)
keymap("v", "L", "U", noremap)

-- Rebinding displaced keys.
keymap("v", "h", "m", noremap)
keymap("v", "H", "M", noremap)
keymap("v", "j", "e", noremap)
keymap("v", "J", "E", noremap)
keymap("v", "k", "n", noremap)
keymap("v", "K", "N", noremap)

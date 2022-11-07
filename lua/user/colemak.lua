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

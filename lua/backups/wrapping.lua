local noremap = { noremap = true, silent = true }

-- Shorten function name.
local keymap = vim.api.nvim_set_keymap

function SetWrapped()
    vim.cmd([[
        set wrap
        set linebreak
    ]])
    keymap("n", "n", "gj", noremap)
    keymap("n", "e", "gk", noremap)
    vim.opt.number = false
    vim.opt.rnu = false
end

function UnsetWrapped()
    vim.cmd([[
        set nowrap
    ]])
    keymap("n", "n", "j", noremap)
    keymap("n", "e", "k", noremap)
    vim.opt.number = true
    vim.opt.rnu = true
end

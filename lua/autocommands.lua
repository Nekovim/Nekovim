-- Call CodeLens refresh
vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	once = true,
	callback = vim.lsp.codelens.refresh,
})

-- Norg Mappings in Which-Key
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.norg",
	callback = function()
		require("which-key").register(require("mappings").neorg_labels, {
			mode = "n",
			prefix = "<leader>",
			buffer = 0,
			noremap = true,
			silent = true,
		})
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gd", "gdscript", "gdscript3" },
	callback = function()
        vim.cmd [[setlocal noexpandtab]]
    end,
})

local hover_files = {
    cpp = true,
    c = true,
    rust = true,
    cs = false,
    gdscript = true,
    lua = false,
    norg = false,
    md = false,
    go = false,
    python = true,
}

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
        if not hover_files[vim.bo.filetype] or hover_files[vim.bo.filetype] == nil then
            return
        end
            vim.lsp.buf.hover()
  end,
})
-- Autosave
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
-- 	pattern = {"*.txt", "*.norg", "*.md"},
-- 	callback = function ()
-- 	   vim.cmd.write()
-- 	end,
-- })

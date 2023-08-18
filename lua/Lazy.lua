local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

local lazy = {}

lazy.modules = {
	-- Depends
	{ import = "modules.depends" },

	-- Core
	{ import = "modules.core" },
	{ import = "modules.core.debug" },
	{ import = "modules.core.flow" },
	{ import = "modules.core.motions" },
	{ import = "modules.core.git" },
	{ import = "modules.core.languages" },
	{ import = "modules.core.legible" },
	{ import = "modules.core.lsp" },
	{ import = "modules.core.debug" },

	-- Looks
	{ import = "modules.looks" },
	{ import = "modules.looks.themes" },
	{ import = "modules.looks.ui" },

	-- Writing
	{ import = "modules.writing" },
	{ import = "modules.writing.neorg" },

	-- Tools
	{ import = "modules.tools" },
}

lazy.opts = {
	install = { colorscheme = { require("modules.looks.themes.primary_theme").name } },
	defaults = { lazy = true, version = "57cce98dfdb2f2dd05a0567d89811e6d0505e13b" },
	ui = { wrap = "true" },
	checker = { enabled = true },
	change_detection = { enabled = true },
	debug = false,
}

-- load lazy
require("lazy").setup(lazy.modules, lazy.opts)

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

local lazy = {}

lazy.modules = {
  -- Depends
  { import = "modules.depends" },

  -- Core
  -- { import = "modules.core" },
  { import = "modules.core.debug" },
  { import = "modules.core.flow" },
  { import = "modules.core.motions" },
  { import = "modules.core.git" },
  { import = "modules.core.languages" },
  { import = "modules.core.legible" },
  { import = "modules.core.lsp" },
  { import = "modules.core.debug" },

  -- Looks
  -- { import = "modules.looks" },
  { import = "modules.looks.look-and-feel" },
  { import = "modules.looks.themes" },
  { import = "modules.looks.ui" },

  -- Writing
  -- { import = "modules.writing" },
  { import = "modules.writing.neorg" },

  -- Tools
  { import = "modules.tools" },
}

lazy.opts = {
  install = { colorscheme = { require("user-options").primary_theme } },
  defaults = { lazy = true, version = "*" },
  ui = { wrap = "true" },
  checker = { enabled = true },
  change_detection = { enabled = true },
  debug = false,
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
    versions = true, -- Honor versions in pkg sources
    -- the first package source that is found for a plugin will be used.
    sources = {
      "lazy",
      -- "rockspec",
      "packspec",
    },
  },
}

-- load lazy
require("lazy").setup(lazy.modules, lazy.opts)

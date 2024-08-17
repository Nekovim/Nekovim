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
  -- -- Depends
  -- { import = "modules.depends" },
  --
  -- -- Core
  -- -- { import = "modules.core" },
  -- { import = "modules.core.debug" },
  -- { import = "modules.core.flow" },
  -- { import = "modules.core.motions" },
  -- { import = "modules.core.git" },
  -- { import = "modules.core.languages" },
  -- { import = "modules.core.legible" },
  -- { import = "modules.core.lsp" },
  -- { import = "modules.core.debug" },
  --
  -- -- Looks
  -- -- { import = "modules.looks" },
  -- { import = "modules.looks.look-and-feel" },
  -- { import = "modules.looks.themes" },
  -- { import = "modules.looks.ui" },
  --
  -- -- Writing
  -- -- { import = "modules.writing" },
  -- { import = "modules.writing.neorg" },
  --
  -- -- Tools
  -- { import = "modules.tools" },
  {
    "folke/which-key.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
      {
        "kyazdani42/nvim-web-devicons",
      },
    },
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" },
      icons = {
        mappings = false,
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          D = "󰘳 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          ScrollWheelDown = "󱕐 ",
          ScrollWheelUp = "󱕑 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",

          Tab = "󰌒 ",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",

          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
      },
      keys = {
        scroll_down = "<c-n>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      win = {
        -- border = "rounded", -- none, single, double, shadow
        -- position = "bottom", -- bottom, top
        -- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        -- winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "g", mode = { "n", "v" } },
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
      local mappings = require "mappings.global"
      opts.spec = mappings.which_key
    end,
  },
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
    cache = vim.fn.stdpath "state" .. "/lazy/pkg-cache.lua",
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

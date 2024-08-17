local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    {
      "kyazdani42/nvim-web-devicons",
      event = "VeryLazy",
    },
    {
      "windwp/nvim-ts-autotag",
    },
  },
}

M.opts = {
  ensure_installed = {
    "bash",
    "lua",
    "python",
    "javascript",
    "typescript",
    "gdscript",
    "markdown",
    "markdown_inline",
    "html",
    "toml",
    "json",
    "rust",
    "go",
    "c",
    "cpp",
    "c_sharp",
    "java",
    "norg",
    "make",
    "cmake",
    "css",
    "svelte",
    "vim",
    "vue",
    "regex",
    "dart",
  }, -- put the language you want in this array
  -- ensure_installed = "all", -- one of "all" or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },

  indent = { enable = true, disable = { "python", "css", "html", "gdscript", "gdscript3", "gd" } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

function M.config(_, opts)
  require "nvim-treesitter"
  require("nvim-treesitter.install").compilers = { "clang" }
  require("nvim-treesitter.configs").setup(opts)
  require("nvim-ts-autotag").setup {
    enable_close_on_slash = true,
  }
  vim.g.skip_ts_context_commentstring_module = true
end

return M

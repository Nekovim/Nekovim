local M = {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
}

M.opts = {
  -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
  detection_methods = { "pattern" },

  on_project_selected = function(prompt_bufnr, opts)
    local persistence = require "persistence"
    local sfile = persistence.get_current()
    if vim.fn.filereadable(sfile) ~= 0 then
      persistence.load()
      return
    end

    require("telescope.builtin").find_files()
  end,

  -- patterns used to detect root dir, when **"pattern"** is in detection_methods
  patterns = { ".git", "Makefile", "package.json", ".nvimproj", "cargo.toml", "csproj" },
}

function M.config(_, opts)
  require("project_nvim").setup(opts)
  require("telescope").load_extension "projects"
end

return M

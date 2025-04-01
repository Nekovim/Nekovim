local M = {
  "kevinhwang91/nvim-ufo",
  event = "VimEnter",
  enabled = false,
  dependencies = {
    {
      "kevinhwang91/promise-async",
    },
  },
}

function M.config(_, opts)
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldtext = ""
  vim.opt.fillchars:append "fold: "
  vim.opt.foldlevelstart = 99

  require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
  })
end

return M

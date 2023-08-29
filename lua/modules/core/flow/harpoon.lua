local M = {
  "ThePrimeagen/harpoon",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" }
  }
}

M.config = function ()
  require("harpoon").setup()
  require("telescope").load_extension "harpoon"
end

return M

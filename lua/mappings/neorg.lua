local M = {}

-- Mappings for Neorg mode (Only visible in Neorg mode).
-- NOTE: These are only the labels. You need to change these in neorg.lua ["core.keybinds"] for them to take effect.
M.neorg_leader = "<leader>n"

-- Callback used to bind keys when entering neorg buffer. Can't be done directly through which-key.
M.neorg_bindings = function(keybinds)
  -- View Table of Contents
  keybinds.remap_key("norg", "n", "<C-Space>", "<C-cr>")
  keybinds.map("all", "n", "<leader>n<C-/>", "<cmd>:Neorg toc qflist<CR>")

  -- Telescope Find Neorg Files
  keybinds.map("all", "n", "<leader><leader>", "<cmd>:Telescope neorg find_norg_files<CR>")
  keybinds.map("all", "n", "<leader>n,", "<cmd>:Telescope neorg search_headings<CR>")

  -- Telescope Insert Normal Link
  keybinds.map("norg", "n", "<leader>nil", "<cmd>:Telescope neorg insert_link<CR>")
  keybinds.map("norg", "i", "<C-.>l", "<cmd>:Telescope neorg insert_link<CR>")

  -- Telescope Insert File Link
  keybinds.map("norg", "n", "<leader>nif", "<cmd>:Telescope neorg insert_file_link<CR>")
  keybinds.map("norg", "i", "<C-.>f", "<cmd>:Telescope neorg insert_file_link<CR>")

  -- Open Code Looking Glass
  keybinds.remap_event("all", "n", "<leader>nvl", "core.looking-glass.magnify-code-block")
  keybinds.remap_event("all", "i", "<C-.><cr>", "core.looking-glass.magnify-code-block")

  -- Insert Meta Data
  keybinds.map("norg", "n", "<leader>nim", "<cmd>:Neorg inject-metadata<CR>")
end

M.neorg_labels = {
  n = {
    name = "Neorg Mode",
    [","] = { "Find Heading" },
    ["<C-/>"] = { "Open Table of Contents" },
    i = {
      name = "Insert",
      d = { "Date" },
      f = { "File Link" },
      l = { "Link" },
      m = { "Meta Data" },
    },
    l = {
      name = "List",
      i = { "Invert" },
      t = { "Toggle (Un)ordered" },
    },
    m = {
      name = "Mode",
      h = { "Enter Heading Traversal Mode" },
      n = { "Enter Neorg Mode" },
    },
    n = {
      name = "Note",
      n = { "New Note" },
    },
    t = {
      name = "Task",
      a = { "Mark Ambiguous" },
      c = { "Mark Cancelled" },
      d = { "Mark Done" },
      h = { "Mark On Hold" },
      i = { "Mark Important" },
      p = { "Mark Pending" },
      r = { "Mark Recurring" },
      u = { "Mark Undone" },
    },
    v = {
      name = "View",
      l = { "Looking Glass" },
    },
  },
}

return M

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
	-- Neorg Mode
		{ "<leader>n", group = "Neorg Mode", nowait = true, remap =false, mode = "n" },
    {"<leader>n,", desc = "Find Heading", nowait = true, remap =false, mode = "n" },
    {"<leader>n<C-/>", desc = "Open Table of Contents", nowait = true, remap =false, mode = "n" },

  -- Neorg Mode -> Insert
		{ "<leader>ni", group = "Insert" , nowait = true, remap =false, mode = "n"},
    {"<leader>nid", desc = "Date" , nowait = true, remap =false, mode = "n"},
    {"<leader>nif", desc = "File Link" , nowait = true, remap =false, mode = "n"},
    {"<leader>nil", desc = "Link" , nowait = true, remap =false, mode = "n"},
    {"<leader>nim", desc = "Meta Data" , nowait = true, remap =false, mode = "n"},

  -- Neorg Mode -> List
		{ "<leader>nl", group = "List", nowait = true, remap =false, mode = "n" },
    {"<leader>nli", desc = "Invert", nowait = true, remap =false, mode = "n" },
    {"<leader>nlt", desc = "Toggle (Un)ordered", nowait = true, remap =false, mode = "n" },

  -- Neorg Mode -> Mode
		{ "<leader>nm", group = "Mode", nowait = true, remap =false, mode = "n" },
    {"<leader>nmh", desc = "Enter Heading Traversal Mode", nowait = true, remap =false, mode = "n" },
    {"<leader>nmn", desc = "Enter Neorg Mode", nowait = true, remap =false, mode = "n" },


  -- Neorg Mode -> Note
		{ "<leader>nn", group = "Note", nowait = true, remap =false, mode = "n" },
    { "<leader>nnn", desc = "New Note", nowait = true, remap =false, mode = "n" },

  -- Neorg Mode -> Task
		{ "<leader>nt", group = "Task", nowait = true, remap =false, mode = "n" },
    {"<leader>nta", desc = "Mark Ambiguous", nowait = true, remap =false, mode = "n" },
    {"<leader>ntc", desc = "Mark Cancelled", nowait = true, remap =false, mode = "n" },
    {"<leader>ntd", desc = "Mark Done", nowait = true, remap =false, mode = "n" },
    {"<leader>nth", desc = "Mark On Hold", nowait = true, remap =false, mode = "n" },
    {"<leader>nti", desc = "Mark Important", nowait = true, remap =false, mode = "n" },
    {"<leader>ntp", desc = "Mark Pending", nowait = true, remap =false, mode = "n" },
    {"<leader>ntr", desc = "Mark Recurring", nowait = true, remap =false, mode = "n" },
    {"<leader>ntu", desc = "Mark Undone", nowait = true, remap =false, mode = "n" },

  -- Neorg Mode -> View
		{ "<leader>nv", group = "View", nowait = true, remap =false, mode = "n" },
    {"<leader>nvl", desc = "Looking Glass", nowait = true, remap =false, mode = "n" },
}

return M

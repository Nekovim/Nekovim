local M = {}

M.cmp = {
  ["next-item"] = "<C-e>",
  ["prev-item"] = "<C-n>",
  ["scroll-doc-down"] = "<C-b>",
  ["scroll-doc-up"] = "<C-f>",
  ["complete"] = "<C-Space>",
  ["close"] = "<CR>",
  ["confirm"] = "<C-cr>",
  ["super-tab"] = "<Tab>",
  ["super-tab-alt"] = "<S-Tab>",
}

M.chatgpt = {
  with_instructions = {
    close = "<C-c>",
    accept = "<C-y>",
    toggle_diff = "<C-d>",
    toggle_settings = "<C-o>",
    cycle_windows = "<Tab>",
    use_output_as_input = "<C-i>",
  },

  chat = {
    close = "<C-c>",
    yank_last = "<C-y>",
    yank_last_code = "<C-k>",
    scroll_up = "<C-e>",
    scroll_down = "<C-n>",
    new_session = "<C-s>",
    cycle_windows = "<Tab>",
    cycle_modes = "<C-f>",
    select_session = "<Space>",
    rename_session = "r",
    delete_session = "d",
    draft_message = "<C-d>",
    toggle_settings = "<C-o>",
    toggle_message_role = "<C-m>",
    toggle_system_role_open = "<C-r>",
  },
}

M.mini_surround = {
  add = "sa", -- Add surrounding in Normal and Visual modes
  delete = "sd", -- Delete surrounding
  find = "sf", -- Find surrounding (to the right)
  find_left = "sF", -- Find surrounding (to the left)
  highlight = "sh", -- Highlight surrounding
  replace = "sr", -- Replace surrounding
  update_n_lines = "sn", -- Update `n_lines`

  suffix_last = "l", -- Suffix to search with "prev" method
  suffix_next = "n", -- Suffix to search with "next" method
}

return M

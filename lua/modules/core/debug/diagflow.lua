local M = {
  "dgagn/diagflow.nvim",
  -- Loaded by lsp.lua
}

M.opts = {
  enable = true,
  max_width = 60, -- The maximum width of the diagnostic messages
  severity_colors = { -- The highlight groups to use for each diagnostic severity level
    error = "DiagnosticFloatingError",
    warning = "DiagnosticFloatingWarn",
    info = "DiagnosticFloatingInfo",
    hint = "DiagnosticFloatingHint",
  },
  gap_size = 1,
  scope = "line", -- 'cursor', 'line'
  padding_top = 0,
  padding_right = 0,
  text_align = "right", -- 'left', 'right'
  placement = "top", -- 'top', 'inline'
  inline_padding_left = 0, -- the padding left when the placement is inline
  update_event = { "DiagnosticChanged" }, -- the event that updates the diagnostics cache
  toggle_event = { "InsertEnter" }, -- if InsertEnter, can toggle the diagnostics on inserts
}

return M

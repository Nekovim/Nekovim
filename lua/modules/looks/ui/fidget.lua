local M = {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  tag = "legacy",
}

M.opts = {
  text = {
    spinner = "dots", -- animation shown when tasks are ongoing
    done = "✔", -- character shown when all tasks are complete
    commenced = "Started", -- message shown when task starts
    completed = "Completed", -- message shown when task completes
  },
  timer = {
    spinner_rate = 125,
    fidget_decay = 2000,
    task_decay = 1000,
  },
}

return M

local M = {}

-- We need to append to the M both DAP and DAPUI's info and config stuff.
-- This is done because the keys need to be in numerical order starting from 1.

-- DAP
M[#M + 1] = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    {
      "ravenxrz/DAPInstall.nvim",
      event = "VeryLazy",
    },
  },

  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open { reset = true }
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      -- dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close()
    end

    dap.configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
      name = "lldb",
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        -- add other configs hereby
      },
    }

    dap.configurations.c = dap.configurations.cpp

    dap.adapters.godot = {
      type = "server",
      host = "127.0.0.1",
      port = "6006",
    }

    dap.configurations.gdscript = {
      {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "${workspaceFolder}",
        launch_scene = true,
      },
    }

    local dap_install = require "dap-install"
    dap_install.setup {}
    dap_install.config("python", {})
  end,
}

-- DAPUI
M[#M + 1] = {
  "rcarriga/nvim-dap-ui",
  commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      commit = "6b12294a57001d994022df8acbe2ef7327d30587",
      event = "VeryLazy",
    },
    {
      "ravenxrz/DAPInstall.nvim",
      commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
    },
  },

  config = function()
    require("dapui").setup {
      expand_lines = true,
      icons = { expanded = "", collapsed = "", circular = "" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "watches", size = 0.24 },
            { id = "scopes", size = 0.24 },
            { id = "breakpoints", size = 0.24 },
            { id = "stacks", size = 0.28 },
          },
          size = 0.23,
          position = "right",
        },
        {
          elements = {
            { id = "repl", size = 0.55 },
            { id = "console", size = 0.45 },
          },
          size = 0.27,
          position = "bottom",
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5, -- Floats will be treated as percentage of your screen.
        border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    }

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
  end,
}

return M

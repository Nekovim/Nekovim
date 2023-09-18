-- Base Mappings used for assigning all other LSP mappings.

---@enum Label
local Label = {
  CODE_ACTIONS = { key = "c", name = "Code Actions" },
  DEBUG = { key = "d", name = "Debug" },
  LSP = { key = "l", name = "LSP Actions" },
  PROJECT = { key = "p", name = "Project" },
  REFACTOR = { key = "r", name = "Refactor" },
}

local lsp_bindings = {
  normal = {
    ["hover"] = {
      key = "<cr>",
      command = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
    },

    [Label.CODE_ACTIONS.key] = {
      name = Label.CODE_ACTIONS.name,
      ["actions"] = {
        key = "a",
        command = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
      },
      ["goto-declaration"] = {
        key = "d",
        command = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Declaration" },
      },
      ["goto-definition"] = {
        key = "D",
        command = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Definition" },
      },
      ["line-diagnostics"] = {
        key = "e",
        command = { "<cmd>lua vim.diagnostic.open_float()<cr>", "View Line Diagnostics" },
      },
      ["format"] = {
        key = "f",
        command = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
      },
      ["hover"] = {
        key = "h",
        command = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
      },
      ["implementation"] = {
        key = "i",
        command = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "View Implementations" },
      },
      ["codelens"] = {
        key = "l",
        command = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      },
      ["next-diagnostic"] = {
        key = "n",
        command = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic" },
      },
      ["prev-diagnostic"] = {
        key = "p",
        command = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous Diagnistoc" },
      },
      ["quickfix"] = {
        key = "q",
        command = { "<cmd>lua vim.lsp.diagnostic.setloclist<cr>", "QuickFix" },
      },
      ["references"] = {
        key = "r",
        command = { "<cmd>lua vim.lsp.buf.references()<cr>", "View References" },
      },
      ["document-symbols"] = {
        key = "s",
        command = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      },
      ["workspace-symbols"] = {
        key = "S",
        command = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
    },

    [Label.DEBUG.key] = {
      name = Label.DEBUG.name,
      ["toggle-breakpoint"] = {
        key = ".",
        command = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
      },
      ["clear-breakpoints"] = {
        key = "/",
        command = { "<cmd>lua require('dap').clear_breakpoints()<cr>", "Clear Breakpoins" },
      },
      ["run-dap"] = {
        key = "c",
        command = { "<cmd>DapContinue<cr>", "Run Dap" },
      },
      ["step-into"] = {
        key = "i",
        command = { "<cmd>DapStepInto<cr>", "Step Into" },
      },
      ["run-last"] = {
        key = "l",
        command = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
      },
      ["step-over"] = {
        key = "o",
        command = { "<cmd>DapStepOver<cr>", "Step Over" },
      },
      ["terminate"] = {
        key = "q",
        command = { "<cmd>DapTerminate<cr><cmd>lua require('dapui').close()<cr>", "Terminate" },
      },
      ["toggle-dapui"] = {
        key = "t",
        command = { "<cmd>lua require'dapui'.toggle({reset = true})<CR>", "Toggle UI" },
      },
      ["toggle-repl"] = {
        key = "r",
        command = { "<cmd>DapToggleRepl<CR>", "Toggle Repl" },
      },
      ["step-out"] = {
        key = "x",
        command = { "<cmd>DapStepOut<cr>", "Step Out" },
      },
    },

    [Label.REFACTOR.key] = {
      name = Label.REFACTOR.name,
      ["rename"] = {
        key = "r",
        command = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      },
    },
  },

  visual = {},
}

---@param mappings table A table of strings of the default lsp_bindings you want applied.
---@param label Label|nil The label those bindings live under (nil for top level).
---@param mode "normal"|"insert"|"visual"|nil The mode you want to bind your keys in.
---@param extension table|nil Any additional custom bindings you'd like added under this label.
---@return table
lsp_bindings.fetch_from = function(mappings, label, mode, extension)
  mode = mode or "normal"
  --
  local ret = {}

  if label ~= nil then
    ---@diagnostic disable-next-line: undefined-field
    ret.name = label.name
    for _, mapping in ipairs(mappings) do
      ---@diagnostic disable-next-line: undefined-field
      ret[lsp_bindings[mode][label.key][mapping].key] = lsp_bindings[mode][label.key][mapping].command
    end
  else
    for _, mapping in pairs(mappings) do
      ret[lsp_bindings[mode][mapping].key] = lsp_bindings[mode][mapping].command
    end
  end

  if extension ~= nil then
    ret = vim.tbl_extend("force", ret, extension)
  end
  --
  return ret
end

-- Per-LSP mappings derived from base lsp_bindings.
local M = {}

M.csharp_ls = {
  normal = lsp_bindings.fetch_from({ "hover" }, nil, "normal", {
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from({
      "actions",
      "goto-definition",
      "goto-declaration",
      "line-diagnostics",
      "format",
      "hover",
      "implementation",
      "codelens",
      "next-diagnostic",
      "prev-diagnostic",
      "quickfix",
      "references",
      "document-symbols",
      "workspace-symbols",
    }, Label.CODE_ACTIONS),

    [Label.DEBUG.key] = lsp_bindings.fetch_from({
      "toggle-breakpoint",
      "clear-breakpoints",
      "run-dap",
      "step-into",
      "run-last",
      "step-over",
      "terminate",
      "toggle-dapui",
      "toggle-repl",
      "step-out",
    }, Label.DEBUG),

    [Label.REFACTOR.key] = lsp_bindings.fetch_from({
      "rename",
    }, Label.REFACTOR),
  }),
}

M.dartls = {
  normal = lsp_bindings.fetch_from({ "hover" }, nil, "normal", {
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from(
      {
        "actions",
        "line-diagnostics",
        "format",
        "hover",
        "next-diagnostic",
        "prev-diagnostic",
      },
      Label.CODE_ACTIONS,
      "normal",
      {
        c = { "<cmd>:PlutterSuper<cr>", "Goto Superclass" },
      }
    ),

    [Label.DEBUG.key] = lsp_bindings.fetch_from({
      "toggle-breakpoint",
      "clear-breakpoints",
      "run-dap",
      "step-into",
      "run-last",
      "step-over",
      "terminate",
      "toggle-dapui",
      "toggle-repl",
      "step-out",
    }, Label.DEBUG),

    [Label.LSP.key] = {
      name = Label.LSP.name,
      ["."] = { "<cmd>:Telescope flutter commands<cr>", "Flutter Commands" },
      a = { "<cmd>:FlutterDevToolsActivate<cr>", "Flutter DevTools Activate" },
      d = { "<cmd>:FlutterDevTools<cr>", "Flutter DevTools Start" },
      r = { "<cmd>:FlutterLspRestart<cr>", "Restart Server" },
      R = { "<cmd>:FlutterReanalyze<cr>", "Flutter Reanalyze" },
    },

    [Label.PROJECT.key] = {
      name = Label.PROJECT.name,
      c = { "<cmd>:FlutterRun<cr>", "Flutter Run" },
      d = { "<cmd>:FlutterDevices<cr>", "Flutter Devices" },
      e = { "<cmd>:FlutterEmulators<cr>", "Flutter Emulators" },
      l = { "<cmd>:FlutterDetach<cr>", "Flutter Detach" },
      q = { "<cmd>:FlutterQuit<cr>", "Flutter Quit" },
      R = { "<cmd>:FlutterReload<cr>", "Flutter Reload" },
      r = { "<cmd>:FlutterRestart<cr>", "Flutter Restart" },
    },

    [Label.REFACTOR.key] = {
      name = Label.REFACTOR.name,
      r = { "<cmd>:FlutterRename", "Rename" },
    },
  }),
}

M.gdscript = {
  normal = lsp_bindings.fetch_from({ "hover" }, nil, "normal", {
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from({
      "actions",
      "line-diagnostics",
      "format",
      "hover",
      "next-diagnostic",
      "prev-diagnostic",
    }, Label.CODE_ACTIONS),

    [Label.REFACTOR] = lsp_bindings.fetch_from({
      "rename",
    }, Label.REFACTOR),
  }),
}

M.java = {
  normal = {
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from(
      {
        "actions",
        "goto-definition",
        "goto-declaration",
        "line-diagnostics",
        "format",
        "hover",
        "implementation",
        "codelens",
        "next-diagnostic",
        "prev-diagnostic",
        "quickfix",
        "references",
        "document-symbols",
        "workspace-symbols",
      },
      Label.CODE_ACTIONS,
      "normal",
      {
        o = { "<cmd>lua require('jdtls').organize_imports()<cr>", "Organize Imports" },
      }
    ),

    [Label.DEBUG.key] = lsp_bindings.fetch_from(
      {
        "toggle-breakpoint",
        "clear-breakpoints",
        "run-dap",
        "step-into",
        "run-last",
        "step-over",
        "terminate",
        "toggle-dapui",
        "toggle-repl",
        "step-out",
      },
      Label.DEBUG,
      "normal",
      {
        f = { "<cmd>lua require('jdtls').test_class()<cr>", "Test File" },
        n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
      }
    ),

    [Label.LSP.key] = {
      name = Label.LSP.name,
      c = { "<cmd>:JdtUpdateConfig<cr>", "JDTLS Update Config" },
      d = { "<cmd>:JdtUpdateDebugConfig<cr>", "JDTLS Update Debug Config" },
      h = { "<cmd>:JdtUpdateHotcode<cr>", "JDTLS Update Hotcode" },
      R = { "<cmd>:JdtSetRuntime<cr>", "JDTLS Set Java Runtime" },
      r = { "<cmd>:JdtRestart<cr>", "Restart Server" },
    },

    [Label.PROJECT.key] = {
      name = Label.PROJECT.name,
      c = { "<cmd>JdtCompile<cr>", "Compile" },
    },

    -- Refactoring Bindings.
    [Label.REFACTOR.key] = lsp_bindings.fetch_from(
      {
        "rename",
      },
      Label.REFACTOR,
      "normal",
      {
        c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
        e = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
        m = { "<cmd>lua require('jdtls').extract_method()<cr>", "Extract Method" },
      }
    ),
  },

  visual = {
    [Label.REFACTOR.key] = {
      name = "Refactor",
      c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
      e = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
      m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
    },
  },
}

M.lua_ls = {
  normal = lsp_bindings.fetch_from({ "hover" }, nil, "normal", {
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from({
      "actions",
      "line-diagnostics",
      "format",
      "hover",
      "next-diagnostic",
      "prev-diagnostic",
      "references",
      "document-symbols",
      "workspace-symbols",
    }, Label.CODE_ACTIONS),

    [Label.REFACTOR.key] = lsp_bindings.fetch_from({
      "rename",
    }, Label.REFACTOR),
  }),
}

M.rust = {
  normal = {
    -- Root bindings
    [lsp_bindings.normal["hover"].key] = {
      "<cmd>lua require('rust-tools').hover_actions.hover_actions()<cr>",
      "Hover Actions",
    },

    -- Code Actions
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from(
      {
        "goto-definition",
        "goto-declaration",
        "line-diagnostics",
        "format",
        "implementation",
        "codelens",
        "next-diagnostic",
        "prev-diagnostic",
        "references",
        "document-symbols",
        "workspace-symbols",
      },
      Label.CODE_ACTIONS,
      "normal",
      {
        [lsp_bindings.normal[Label.CODE_ACTIONS.key]["actions"].key] = {
          "<cmd>lua require('rust-tools').code_action_group.code_action_group()<cr>",
          "Code Actions",
        },
        [lsp_bindings.normal[Label.CODE_ACTIONS.key]["hover"].key] = {
          "<cmd>lua require('rust-tools').hover_actions.hover_actions()<cr>",
          "Hover Actions",
        },
      }
    ),

    [Label.DEBUG.key] = lsp_bindings.fetch_from({
      "toggle-breakpoint",
      "clear-breakpoints",
      "run-dap",
      "step-into",
      "run-last",
      "step-over",
      "terminate",
      "toggle-dapui",
      "toggle-repl",
      "step-out",
    }, Label.DEBUG),

    -- Refactoring Bindings.
    [Label.REFACTOR.key] = lsp_bindings.fetch_from({
      "rename",
    }, Label.REFACTOR),
  },
}

-- LSP Mappings to be registered with which-key.
M.default = {
  normal = lsp_bindings.fetch_from({ "hover" }, nil, "normal", {
    [Label.CODE_ACTIONS.key] = lsp_bindings.fetch_from({
      "actions",
      "line-diagnostics",
      "format",
      "hover",
      "next-diagnostic",
      "prev-diagnostic",
    }, Label.CODE_ACTIONS),

    [Label.REFACTOR.key] = lsp_bindings.fetch_from({
      "rename",
    }, Label.REFACTOR),
  }),
}

return M

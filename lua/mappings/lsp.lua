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
  n = {
    ["hover"] = {
      key = "<leader><cr>",
      command = "<cmd>lua vim.lsp.buf.hover()<cr>",
      desc = "Hover Actions",
    },

    [Label.CODE_ACTIONS.key] = {
      ["actions"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "a",
        command = "<cmd>lua vim.lsp.buf.code_action()<cr>",
        desc = "Actions",
      },

      ["goto-declaration"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "d",
        command = "<cmd>lua vim.lsp.buf.definition()<cr>",
        desc = "Goto Declaration",
      },

      ["goto-definition"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "D",
        command = "<cmd>lua vim.lsp.buf.declaration()<cr>",
        desc = "Doto Definition",
      },

      ["line-diagnostics"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "e",
        command = "<cmd>lua vim.diagnostic.open_float()<cr>",
        desc = "View Line Diagnostics",
      },

      ["format"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "f",
        command = "<cmd>lua vim.lsp.buf.format{async=true}<cr>",
        desc = "Format",
      },

      ["hover"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "h",
        command = "<cmd>lua vim.lsp.buf.hover()<cr>",
        desc = "Hover Actions",
      },

      ["implementation"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "i",
        command = "<cmd>lua vim.lsp.buf.implementation()<cr>",
        desc = "View Implementations",
      },

      ["codelens"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "l",
        command = "<cmd>lua vim.lsp.codelens.run()<cr>",
        desc = "CodeLens Action",
      },

      ["next-diagnostic"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "n",
        command = "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
        desc = "Next Diagnostic",
      },

      ["prev-diagnostic"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "p",
        command = "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
        desc = "Previous Diagnostic",
      },

      ["quickfix"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "q",
        command = "<cmd>lua vim.lsp.diagnostic.setloclist<cr>",
        desc = "QuickFix",
      },

      ["references"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "r",
        command = "<cmd>lua vim.lsp.buf.references()<cr>",
        desc = "View References",
      },

      ["document-symbols"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "s",
        command = "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document Symbols",
      },

      ["workspace-symbols"] = {
        key = "<leader>" .. Label.CODE_ACTIONS.key .. "S",
        command = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
      },
    },

    [Label.DEBUG.key] = {
      ["toggle-breakpoint"] = {
        key = "<leader>" .. Label.DEBUG.key .. ".",
        command = "<cmd>DapToggleBreakpoint<cr>",
        desc = "Toggle Breakpoint",
      },

      ["clear-breakpoints"] = {
        key = "<leader>" .. Label.DEBUG.key .. "/",
        command = "<cmd>lua require('dap').clear_breakpoints()<cr>",
        desc = "Clear Breakpoints",
      },

      ["run-dap"] = {
        key = "<leader>" .. Label.DEBUG.key .. "c",
        command = "<cmd>DapContinue<cr>",
        desc = "Run Dap",
      },

      ["step-into"] = {
        key = "<leader>" .. Label.DEBUG.key .. "i",
        command = "<cmd>DapStepInto<cr>",
        desc = "Step Into",
      },

      ["run-last"] = {
        key = "<leader>" .. Label.DEBUG.key .. "l",
        command = "<cmd>lua require'dap'.run_last()<cr>",
        desc = "Run Last",
      },

      ["step-over"] = {
        key = "<leader>" .. Label.DEBUG.key .. "o",
        command = "<cmd>DapStepOver<cr>",
        desc = "Step Over",
      },

      ["terminate"] = {
        key = "<leader>" .. Label.DEBUG.key .. "q",
        command = "<cmd>DapTerminate<cr><cmd>lua require('dapui').close()<cr>",
        desc = "Terminate",
      },

      ["toggle-dapui"] = {
        key = "<leader>" .. Label.DEBUG.key .. "t",
        command = "<cmd>lua require'dapui'.toggle({reset = true})<CR>",
        desc = "Toggle UI",
      },

      ["toggle-repl"] = {
        key = "<leader>" .. Label.DEBUG.key .. "r",
        command = "<cmd>DapToggleRepl<CR>",
        desc = "Toggle Repl",
      },

      ["step-out"] = {
        key = "<leader>" .. Label.DEBUG.key .. "x",
        command = "<cmd>DapStepOut<cr>",
        desc = "Step Out",
      },
    },

    [Label.REFACTOR.key] = {
      ["rename"] = {
        key = "<leader>" .. Label.REFACTOR.key .. "r",
        command = "<cmd>lua vim.lsp.buf.rename()<cr>",
        desc = "Rename",
      },
    },
  },

  i = {},

  v = {},
}

---@param key string The group for the labels you want.
---@param mappings table The labels for all the bindings you want.
---@param extension table|nil Any additional custom bindings you'd like added under this label.
---@param mode string|nil Normal, insert, visual, etc.
---@return table
lsp_bindings.fetch = function(key, mappings, extension, mode)
  mode = mode or "n"
  -- --
  local ret = {
    { "<leader>" .. Label.REFACTOR.key, group = Label.REFACTOR.name },
    { "<leader>" .. Label.DEBUG.key, group = Label.DEBUG.name },
    { "<leader>" .. Label.CODE_ACTIONS.key, group = Label.CODE_ACTIONS.name },
  }

  for _, mapping in ipairs(mappings) do
    ---@diagnostic disable-next-line: undefined-field
    local mapping_settings = lsp_bindings[mode][key][mapping]
    if mapping == "_group" then
      ret[#ret + 1] = mapping_settings
    else
      ret[#ret + 1] = {
        mapping_settings.key,
        mapping_settings.command,
        desc = mapping_settings.desc,
        mode = mode,
        nowait = true,
        remap = false,
      }
    end
  end

  if extension ~= nil then
    ret = vim.tbl_extend("force", ret, extension)
  end
  -- --
  return ret
end

local M = {}

M.all = {
  {
    "<leader><cr>",
    "<cmd>lua vim.lsp.buf.hover()<cr>",
    desc = "Hover Actions",
    nowait = true,
    remap = false,
    mode = "n",
  },
  { "<leader>c", group = "Code Actions" },
  {
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    desc = "Actions",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cd",
    "<cmd>lua vim.lsp.buf.definition()<cr>",
    desc = "Goto Declaration",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cD",
    "<cmd>lua vim.lsp.buf.declaration()<cr>",
    desc = "Doto Definition",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>ce",
    "<cmd>lua vim.diagnostic.open_float()<cr>",
    desc = "View Line Diagnostics",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cf",
    "<cmd>lua vim.lsp.buf.format{async=true}<cr>",
    desc = "Format",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>ch",
    "<cmd>lua vim.lsp.buf.hover()<cr>",
    desc = "Hover Actions",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>ci",
    "<cmd>lua vim.lsp.buf.implementation()<cr>",
    desc = "View Implementations",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cl",
    "<cmd>lua vim.lsp.codelens.run()<cr>",
    desc = "CodeLens Action",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cn",
    "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
    desc = "Next Diagnostic",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cp",
    "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
    desc = "Previous Diagnostic",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cq",
    "<cmd>lua vim.lsp.diagnostic.setloclist<cr>",
    desc = "QuickFix",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cr",
    "<cmd>lua vim.lsp.buf.references()<cr>",
    desc = "View References",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cs",
    "<cmd>Telescope lsp_document_symbols<cr>",
    desc = "Document Symbols",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>cS",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    desc = "Workspace Symbols",
    nowait = true,
    remap = false,
    mode = "n",
  },
  { "<leader>d", group = "Debug" },
  {
    "<leader>d.",
    "<cmd>DapToggleBreakpoint<cr>",
    desc = "Toggle Breakpoint",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>d/",
    "<cmd>lua require('dap').clear_breakpoints()<cr>",
    desc = "Clear Breakpoints",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>dc",
    "<cmd>DapContinue<cr>",
    desc = "Run Dap",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>di",
    "<cmd>DapStepInto<cr>",
    desc = "Step Into",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>dl",
    "<cmd>lua require'dap'.run_last()<cr>",
    desc = "Run Last",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>do",
    "<cmd>DapStepOver<cr>",
    desc = "Step Over",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>dq",
    "<cmd>DapTerminate<cr><cmd>lua require('dapui').close()<cr>",
    desc = "Terminate",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>dt",
    "<cmd>lua require'dapui'.toggle({reset = true})<CR>",
    desc = "Toggle UI",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>dr",
    "<cmd>DapToggleRepl<CR>",
    desc = "Toggle Repl",
    nowait = true,
    remap = false,
    mode = "n",
  },
  {
    "<leader>dx",
    "<cmd>DapStepOut<cr>",
    desc = "Step Out",
    nowait = true,
    remap = false,
    mode = "n",
  },
  { "<leader>r", group = "Refactor" },
  {
    "<leader>rr",
    "<cmd>lua vim.lsp.buf.rename()<cr>",
    desc = "Rename",
    nowait = true,
    remap = false,
    mode = "n",
  },
}

M.lua = lsp_bindings.fetch(
  Label.CODE_ACTIONS.key,
  {
    "actions",
    "line-diagnostics",
    "format",
    "hover",
    "next-diagnostic",
    "prev-diagnostic",
    "references",
    "document-symbols",
    "workspace-symbols",
  },
  lsp_bindings.fetch(Label.REFACTOR.key, {
    "rename",
  })
)

M.rust = lsp_bindings.fetch(
  Label.CODE_ACTIONS.key,
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
  lsp_bindings.fetch(
    Label.DEBUG.key,
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
    lsp_bindings.fetch(Label.REFACTOR.key, {
      "rename",
    }, {
      {
        lsp_bindings["n"][Label.CODE_ACTIONS.key]["actions"].key,
        "<cmd>lua require('rust-tools').code_action_group.code_action_group()<cr>",
        desc = "Code Actions",
      },
      {
        lsp_bindings["n"][Label.CODE_ACTIONS.key]["hover"].key,
        "<cmd>lua require('rust-tools').hover_actions.hover_actions()<cr>",
        desc = "Hover Actions",
      },
    })
  )
)

M.vue = lsp_bindings.fetch(
  Label.CODE_ACTIONS.key,
  {
    "actions",
    "line-diagnostics",
    "format",
    "hover",
    "next-diagnostic",
    "prev-diagnostic",
    "references",
    "document-symbols",
    "workspace-symbols",
  },
  lsp_bindings.fetch(Label.REFACTOR.key, {
    "rename",
  })
)

M.ts_ls = M.all

M.default = lsp_bindings.fetch(
  Label.CODE_ACTIONS.key,
  {
    "actions",
    "line-diagnostics",
    "format",
    "hover",
    "next-diagnostic",
    "prev-diagnostic",
  },
  lsp_bindings.fetch(Label.REFACTOR.key, {
    "rename",
  })
)

return M

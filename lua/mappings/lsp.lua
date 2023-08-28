-- Base Mappings used for assigning all other LSP mappings.

---@enum Label
local Label = {
  DEBUG = "d",
  CODE_ACTIONS = "c",
  REFACTOR = "r",
}

local base = {
  normal = {
    ["hover"] = {
      key = "<cr>",
      command = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
    },

    [Label.CODE_ACTIONS] = {
      name = "Code Actions",
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
        key = "I",
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

    [Label.DEBUG] = {
      name = "Debug",
    },

    [Label.REFACTOR] = {
      name = "Refactor",
      ["rename"] = {
        key = "r",
        command = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      },
    },
  },

  insert = {},

  visual = {},
}

base.fetch_from = function(mappings, label, mode, extension)
  mode = mode or "normal"
  --
  local ret = {}

  if label ~= nil then
    ret.name = base[mode][label].name
    for _, mapping in ipairs(mappings) do
      ret[base[mode][label][mapping].key] = base[mode][label][mapping].command
    end
  else
    for _, mapping in pairs(mappings) do
      ret[base[mode][mapping].key] = base[mode][mapping].command
    end
  end

  if extension ~= nil then
    ret = vim.tbl_extend("force", ret, extension)
  end
  --
  return ret
end

-- Per-LSP mappings derived from base mappings.

local M = {}

M.java = {
  normal = {
    [Label.CODE_ACTIONS] = base.fetch_from(
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
        c = { "<cmd>JdtCompile<cr>", "Compile" },
        o = { "<cmd>lua require('jdtls').organize_imports()<cr>", "Organize Imports" },
      }
    ),

    [Label.DEBUG] = {
      f = { "<cmd>lua require('jdtls').test_class()<cr>", "Test File" },
      n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
    },

    -- Refactoring Bindings.
    [Label.REFACTOR] = base.fetch_from(
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

  insert = nil,

  visual = {
    [Label.REFACTOR] = {
      name = "Refactor",
      c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
      e = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
      m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
    },
  },
}

M.rust = {
  normal = {
    -- Root bindings
    [base.normal["hover"].key] = { "<cmd>lua require('rust-tools').hover_actions.hover_actions()<cr>", "Hover Actions" },

    -- Code Actions
    [Label.CODE_ACTIONS] = base.fetch_from(
      {
        "goto-definition",
        "goto-declaration",
        "line-diagnostics",
        "format",
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
        [base.normal[Label.CODE_ACTIONS]["actions"].key] = {
          "<cmd>lua lua require('rust-tools').code_action_group.code_action_group()<cr>",
          "Code Actions",
        },
        [base.normal[Label.CODE_ACTIONS]["hover"].key] = {
          "<cmd>lua require('rust-tools').hover_actions.hover_actions()<cr>",
          "Hover Actions",
        },
      }
    ),

    -- Refactoring Bindings.
    [Label.REFACTOR] = base.fetch_from({
      "rename",
    }, Label.REFACTOR),
  },

  insert = nil,

  visual = nil,
}

-- LSP Mappings to be registered with which-key.
M.default = {
  normal = base.fetch_from({ "hover" }, nil, "normal", {
    [Label.CODE_ACTIONS] = base.fetch_from({
      "actions",
      "line-diagnostics",
      "format",
      "hover",
      "next-diagnostic",
      "prev-diagnostic",
    }, Label.CODE_ACTIONS),
  }),

  [Label.REFACTOR] = base.fetch_from({
    "rename",
  }, Label.REFACTOR),
}

return M

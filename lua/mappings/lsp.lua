local M = {}

-- LSP Mappings to be registered with which-key.
M.all = {
  normal = {
    ["<cr>"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },

    c = {
      name = "Code Actions",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Declaration" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Definition" },
      e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "View Line Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
      I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "View Implementations" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      n = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous Diagnistoc" },
      q = { "<cmd>lua vim.lsp.diagnostic.setloclist<cr>", "QuickFix" },
      r = { "<cmd>lua vim.lsp.buf.references()<cr>", "View References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },

    r = {
      name = "Refactor",
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    },
  },
}

M.diagnostics = {
  normal = {
    ["<cr>"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },

    c = {
      name = "Code Actions",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
      e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "View Line Diagnostics" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
      n = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous Diagnistoc" },
      q = { "<cmd>lua vim.lsp.diagnostic.setloclist<cr>", "QuickFix" },
    },
  },
}

M.java = {
  normal = {
    c = {
      name = "Code Actions",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
      c = { "<cmd>JdtCompile<cr>", "Compile" },
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Declaration" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Definition" },
      e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "View Line Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Actions" },
      I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "View Implementations" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      n = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic" },
      o = { "<cmd>lua require('jdtls').organize_imports()<cr>", "Organize Imports" },
      p = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous Diagnistoc" },
      q = { "<cmd>lua vim.lsp.diagnostic.setloclist<cr>", "QuickFix" },
      r = { "<cmd>lua vim.lsp.buf.references()<cr>", "View References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },

    d = {
      name = "Debug",
      f = { "<cmd>lua require('jdtls').test_class()<cr>", "Test File" },
      n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
    },

    r = {
      name = "Refactor",
      c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
      e = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
      m = { "<cmd>lua require('jdtls').extract_method()<cr>", "Extract Method" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    },
  },
  insert = nil,
  visual = {
    r = {
      name = "Refactor",
      c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
      e = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
      m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
    },
  },
}

return M

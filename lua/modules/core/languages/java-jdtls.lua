-- jdtls project structure config.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv "HOME" .. "/.local/share/java/workspaces/" .. project_name

-- Debug dependencies.
local bundles = {
  vim.fn.glob(vim.fn.stdpath "data" .. "/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar", 1),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath "data" .. "/mason/share/java-test/*.jar", 1), "\n"))

-- Lazy setup.
local M = {
  "mfussenegger/nvim-jdtls",
  ft = "java",
}

M.opts = {
  on_attach = function(client, bufnr)
    local register = require("mappings.utils").register
    local mappings = require "mappings.lsp"

    -- lsp_keymaps(bufnr)
    register(mappings.java.normal, bufnr)
    register(mappings.java.visual, bufnr, "v")
    require("illuminate").on_attach(client)
    require("nvim-navic").attach(client, bufnr)
  end,

  cmd = {
    "java", -- IMPORTANT: or '/path/to/java17_or_newer/bin/java'
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(vim.fn.stdpath "data" .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", 1), -- IMPORTANT
    "-configuration",
    vim.fn.stdpath "data" .. "/mason/packages/jdtls/config_linux", -- IMPORTANT
    "-data",
    workspace_dir, -- IMPORTANT
  },

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {},
  },

  -- Language server `initializationOptions`
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  init_options = {
    bundles = bundles,
  },
}

M.config = function(_, opts)
  opts.root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" }

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "java" },
    callback = function()
      require("jdtls").start_or_attach(opts)
    end,
  })
end

return M

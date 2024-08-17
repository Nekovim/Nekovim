return {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  init_options = {
    typescript = {
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    },
  },
}

return {
  on_attach = function(client, bufnr)
    require("settings.servers").default_on_attach(client, bufnr)

    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   buffer = bufnr,
    --   command = "EslintFixAll",
    -- })
  end,
}

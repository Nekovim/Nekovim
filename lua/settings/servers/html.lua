return {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    require("settings.servers").default_on_attach(client, bufnr)
  end,
}

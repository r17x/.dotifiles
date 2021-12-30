local setup = require('lspconfig').tsserver.setup
local capabilities = require('lsp/capabilities')
local on_attach = require('lsp/on_attach')

setup {
  capabilities = capabilities,
  on_attach = on_attach
}

local setup = require('lspconfig').rescriptls.setup
local fn = vim.fn
local capabilities = require('lsp/capabilities')
local res_server = string.format(
  "%s/vim-rescript",
  fn.stdpath('cache')
)

local res_server_bin = string.format(
  "%s/server/out/server.js",
  res_server
)

if fn.empty(fn.glob(res_server_bin)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/rescript-lang/vim-rescript', res_server })
end

setup {
  capabilities = capabilities,
  cmd = {"node", res_server_bin, "--stdio"}
}

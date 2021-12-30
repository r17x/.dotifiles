local setup = require('lspconfig').sumneko_lua.setup
local fn = vim.fn
local capabilities = require('lsp/capabilities')
local on_attach = require('lsp/on_attach')

local lua_server = string.format(
  "%s/sumneko_lua",
  fn.stdpath('cache')
)
local lua_server_bin = "lua-language-server"
local lua_server_main = string.format(
  "%s/main.lua",
  lua_server
)

if fn.empty(fn.glob(lua_server)) > 0 then
 fn.system({
   'git', 'clone', '--depth', '1', 'https://github.com/sumneko/lua-language-server', lua_server
 })
end

setup {
  cmd = {lua_server_bin, "-E", lua_server_main},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
        -- Setup your lua path
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'use', 'globals'}
      },
      workspace = {
        library = {
          [fn.expand('$VIMRUNTIME/lua')] = true,
          [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

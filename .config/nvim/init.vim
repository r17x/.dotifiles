source ~/.vimrc


" autocmd BufWritePost plugins.lua PackerCompile
" lua require('plugins')

" local lspconfig = require'lspconfig'
" local configs = require'lspconfig/configs'
" local rescriptLspPath = '~/.config/nvim/rescript/rescript-vscode/server/out/server.js'
" 
" if not lspconfig.rescript then
"   configs.rescript = {
"     default_config = {
"       cmd = {'node', rescriptLspPath, '--stdio'};
"       filetypes = {"rescript"};
"       root_dir = lspconfig.util.root_pattern('bsconfig.json');
"       settings = {};
"     };
"   }
" end
" lspconfig.rescript.setup{
" -- with your configurations
" }
" 
" local on_attach = function(client, bufnr)
" local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
" local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
" 
" buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
" 
" -- Mappings.
" local opts = { noremap=true, silent=true }
" buf_set_keymap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
" buf_set_keymap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
" buf_set_keymap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
" buf_set_keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
" buf_set_keymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
" buf_set_keymap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
" buf_set_keymap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
" buf_set_keymap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
" buf_set_keymap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
" buf_set_keymap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
" buf_set_keymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
" buf_set_keymap('<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
" buf_set_keymap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
" buf_set_keymap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
" buf_set_keymap('<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
" 
" -- Set some keybinds conditional on server capabilities
" if client.resolved_capabilities.document_formatting then
"   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
" end
" if client.resolved_capabilities.document_range_formatting then
"   buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
" end
" 
" -- Set autocommands conditional on server_capabilities
" if client.resolved_capabilities.document_highlight then
"   vim.api.nvim_exec([[
"     hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
"     hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
"     hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
"     augroup lsp_document_highlight
"       autocmd! * <buffer>
"       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
"       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
"     augroup END
"     ]], false)
"   end
" end
" 
"   lspconfig.gopls.setup {
"     cmd = {"gopls", "serve"},
"     settings = {
"       gopls = {
"         analyses = {
"           unusedparams = true,
"         },
"         staticcheck = true,
"       },
"     },
"   }
"   function goimports(timeout_ms)
"     local context = { source = { organizeImports = true } }
"     vim.validate { context = { context, "t", true } }
" 
"     local params = vim.lsp.util.make_range_params()
"     params.context = context
" 
"     -- See the implementation of the textDocument/codeAction callback
"     -- (lua/vim/lsp/handler.lua) for how to do this properly.
"     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
"     if not result or next(result) == nil then return end
"     local actions = result[1].result
"     if not actions then return end
"     local action = actions[1]
" 
"     -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
"     -- is a CodeAction, it can have either an edit, a command or both. Edits
"     -- should be executed first.
"     if action.edit or type(action.command) == "table" then
"       if action.edit then
"         vim.lsp.util.apply_workspace_edit(action.edit)
"       end
"       if type(action.command) == "table" then
"         vim.lsp.buf.execute_command(action.command)
"       end
"     else
"       vim.lsp.buf.execute_command(action)
"     end
"   end
" 
" -- Use a loop to conveniently both setup defined servers 
" -- and map buffer local keybindings when the language server attaches
" local servers = {"rescript", "gopls"}
" for _,_lsp in ipairs(servers) do
"   lspconfig[_lsp].setup { on_attach = on_attach }
" end
" 
" autocmd BufWritePre *.go lua goimports(1000)

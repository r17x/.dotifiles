local nnoremap = require('utils').nnoremap

return function(_, bufnr)
    -- require('completion').on_attach()

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    nnoremap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    nnoremap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    nnoremap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    nnoremap('gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    nnoremap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    nnoremap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
end

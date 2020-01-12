"""""""""""""""""""""""""""""
Language Server 
"""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'reason': ['/usr/local/bin/reason-language-server'],
    \ }

set encoding=utf8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug: auto install or self manage of vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim plugins list
" 
" vim-plug: add your plugin after `call plug#begin(...)`
"
" mostly plugin hosted in github/<username|organization_name>/plugin-name
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" it will decrypt your encrypted file (.gpg, .pgp, & .asc)
"
" @example
"
" ```shell
" vim mysecretmessage.gpg 
" ```
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jamessan/vim-gnupg'
" commentary
" gcc to comment out a line (takes a count)
" gc to comment out the target of a motion
Plug 'tpope/vim-commentary'
" when you write if it will make endif 
Plug 'tpope/vim-endwise'
" Diagram / Draw
Plug 'gyim/vim-boxdraw'
Plug 'vim-scripts/DrawIt'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" syntax for rc or configuration file 
Plug 'weakish/rcshell.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THIS IS AN ALTERNATIVE THAN COC
" ReasonML
" Plug 'jordwalke/vim-reasonml' " this is use for reason native development 
" Plug 'kamykn/spelunker.vim'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
"
" for neovim
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " for vim 8 with python
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
"   " `sudo pacman -S pypy3`
"   " the path to python3 is obtained through executing 
"   " `:echo exepath('python4')` in vim
" endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !empty(glob("/usr/bin/pypy3"))
    " uncomment when stable pypy3 in big surp
    " let g:python3_host_prog = "/usr/bin/pypy3" "
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlight for "all" language
Plug 'sheerun/vim-polyglot' 
" fzf integration in vim 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" powered by fzf for writing
Plug 'alok/notational-fzf-vim'
" NERDTreeToggle 
Plug 'preservim/nerdtree' 
" nerdtree for git ignore
Plug 'dsimidzija/vim-nerdtree-ignore'
" Git integration for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Utility
if !has('nvim')
    Plug 'rhysd/vim-healthcheck'
endif
" search task (tech debt) by // TODO or @TODO
Plug 'gilsondev/searchtasks.vim'
Plug 'wesQ3/vim-windowswap'
" right-side tag bar
" current map (normal mode): CTRL+M // [Enter]
Plug 'majutsushi/tagbar'
" async command 
" @example
" ```
" :Dispatch ls -l
" ```
Plug 'tpope/vim-dispatch'
" Communicate with tmux
Plug 'benmills/vimux' 
" Integration Services
" Log my activity to personal `wakatime`
Plug 'wakatime/vim-wakatime'
" Discord Integration 
Plug 'ananagame/vimsence'
" Mustache lang
Plug 'juvenn/mustache.vim'
" Markdown / Writting
Plug 'mzlogin/vim-markdown-toc'
Plug 'reedes/vim-pencil'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'jreybert/vimagit'
" Plug 'mattn/webapi-vim'
" Plug 'mattn/vim-gist'
" Theme / Interface
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" indentline
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
" Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Scoll
Plug 'yuttie/comfortable-motion.vim'
Plug 'itchyny/lightline.vim'
" original: Plug 'rakr/vim-one'
" this is Forked
Plug 'ri7nz/vim-one'
Plug 'sainnhe/edge'
" color hex highlight
Plug 'chrisbra/Colorizer'
" Icon
Plug 'ryanoasis/vim-devicons'
" OpenAPI
" Need `pip install --user openapi-spec-validator`
Plug 'srivathsanmurali/OpenAPIValidate.vim'
Plug 'hsanson/vim-openapi'
Plug 'xavierchow/vim-swagger-preview'
""" NEED TO TRY
" junegunn/vim-easy-align
" Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" HTTP 
Plug 'nicwest/vim-http'
" Productivity ? 
Plug 'itchyny/calendar.vim'
" GQL
Plug 'jparise/vim-graphql'
" ReScript
Plug 'rescript-lang/vim-rescript'
Plug 'arp242/startscreen.vim'
" Map popup
Plug 'liuchengxu/vim-which-key'
call plug#end()

function! BringMeTheVIM()
    read ~/.vim/vimrc.d/amoscreen.bmth
    " Some margin for readability
    :silent %>>
    " Go to line 1
    :1
endfun

let g:Startscreen_function = function('BringMeTheVIM')
" THIS IS AN ALTERNATIVE THAN COC
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'reason': ['/usr/bin/reason-language-server'],
"     \ }
" 
" " enable autocomplete
" let g:deoplete#enable_at_startup = 1
"
" plug: fzf-notational
let g:nv_search_paths = [
   \'~/wiki', 
   \'~/writing', 
   \'docs.md' , 
   \'./notes.md',
   \'~/me/rin.rocks/content'
\]

" source vim configuration from ~/.vim/vimrc.d/
for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> EXPERIMENTAL TODO CHECKBOX
" if exists("b:current_syntax")
"     finish
" endif
" 
" 
" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[x\]" conceal cchar=
" 
" let b:current_syntax = "todo"
" 
" hi def link todoCheckbox Todo
" hi Conceal guibg=NONE
" 
" setlocal cole=1

" Custom conceal
" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[x\]" conceal cchar=
" 
" hi def link todoCheckbox Todo
" 
" highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" 
" setlocal cole=1
" call matchadd('Conceal', '\[\ \]', 0, 11, {'conceal': ''})
" call matchadd('Conceal', '\[x\]', 0, 12, {'conceal': ''})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

if filereadable("~/.cache/calendar.vim/credentials.vim")
    source ~/.cache/calendar.vim/credentials.vim
endif

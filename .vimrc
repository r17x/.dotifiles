""""""""""""""""""""""""""""""""""""""""
"""" @ri7nz <ri7nz.labs@gmail.com> """""
""""""""""""""""""""""""""""""""""""""""

set encoding=utf8

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" GPG
Plug 'jamessan/vim-gnupg'
" Diagram / Draw
Plug 'gyim/vim-boxdraw'
Plug 'vim-scripts/DrawIt'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" RC File
Plug 'weakish/rcshell.vim'

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
"   " the path to python3 is obtained through executing `:echo exepath('python4')` in vim
" endif
" >>--> All Pack syntax highlight
Plug 'sheerun/vim-polyglot' 
if !empty(glob("/usr/bin/pypy3"))
    let g:python3_host_prog = "/usr/bin/pypy3"
endif
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" >>--> FZF Plugin
"if isdirectory("/usr/local/opt/fzf")
"  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"  " Plug 'junegunn/fzf.vim'
"
"  Plug '/usr/local/opt/fzf', { 'do': { -> fzf#install() } }
"  Plug '/usr/local/opt/fzf'
"else
"  Plug '/usr/local/opt/fzf'
"  " Plug 'junegunn/fzf.vim', {'dir': '~/.fzf', 'do': './install --all'}
"endif

Plug 'alok/notational-fzf-vim'

" Dash Documentation
" Plug 'rizzatti/dash.vim'

" NERDTreeToggle 
Plug 'preservim/nerdtree' 
Plug 'dsimidzija/vim-nerdtree-ignore'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility
if !has('nvim')
    Plug 'rhysd/vim-healthcheck'
endif
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'gilsondev/searchtasks.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'majutsushi/tagbar'
" Plug 'preservim/nerdcommenter'
" Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'
" Plug 'scrooloose/syntastic'
" Plug 'yardnsm/vim-import-cost', {'do': 'yarn install'}

" Communicate with tmux
Plug 'benmills/vimux' 
" Plug 'tyewang/vimux-jest-test'

" Integration Services
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
" Plug 'nanotech/jellybeans.vim'
" Plug 'w0ng/vim-hybrid'
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

" Generic Programming Support Plug 'honza/vim-snippets'
" Plug 'Townk/vim-autoclose'
" Plug 'tomtom/tcomment_vim'
" Plug 'tobyS/vmustache'
" Plug 'janko/vim-test'

" Lint
" Plug 'dense-analysis/ale'

" Javascript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'trkw/yarn.vim'
""" NEED TO TRY
" junegunn/vim-easy-align
" Plug 'itchyny/lightline.vim'
" Plug 'preservim/nerdcommenter'
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


"" GET THE FUCKUP
" WAKE THE FUCKUP
" WIPE THE SYSTEM
" AND JUST FUCT THEM ALL 
Plug 'arp242/startscreen.vim'
function! BringMeTheVIM()
    read ~/.vim/vimrc.d/amoscreen.bmth
    " Some margin for readability
    :silent %>>
    " Go to line 1
    :1
endfun
let g:Startscreen_function = function('BringMeTheVIM')
""" 
call plug#end()
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
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" ## let s:opam_share_dir = system("opam config var share")
" ## let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
" ## 
" ## let s:opam_configuration = {}
" ## 
" ## function! OpamConfOcpIndent()
" ##   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" ## endfunction
" ## let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
" ## 
" ## function! OpamConfOcpIndex()
" ##   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" ## endfunction
" ## let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
" ## 
" ## function! OpamConfMerlin()
" ##   let l:dir = s:opam_share_dir . "/merlin/vim"
" ##   execute "set rtp+=" . l:dir
" ## endfunction
" ## let s:opam_configuration['merlin'] = function('OpamConfMerlin')
" ## 
" ## let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" ## let s:opam_check_cmdline = ["opam list --installed --short --safe "] + s:opam_packages
" ## let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" ## for tool in s:opam_packages
" ##   " Respect package order (merlin should be after ocp-index)
" ##   if count(s:opam_available_tools, tool) > 0
" ##     call s:opam_configuration[tool]()
" ##   endif
" ## endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
